import 'dart:async';

import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/boulder/boulder_api_response.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder_back_to_top_button.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder_filter_button.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder_results.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder_sort_button.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder_tile.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/empty_list_indicator.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/error_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BoulderListBuilder extends StatefulWidget {
  const BoulderListBuilder({
    required this.onPageRequested,
    required this.boulderFilterBloc,
    super.key,
    this.showFilterButton = true,
    this.showLocationinfo = true,
    this.bottomHeaderWidget,
    this.topHeaderWidget,
  });

  final BoulderEvent Function(int) onPageRequested;
  final BoulderFilterBloc boulderFilterBloc;
  final bool showFilterButton;
  final bool showLocationinfo;
  final Widget? bottomHeaderWidget;
  final Widget? topHeaderWidget;

  @override
  State<StatefulWidget> createState() => _BoulderListBuilderState();
}

class _BoulderListBuilderState extends State<BoulderListBuilder> {
  final _pagingController = PagingController<int, Boulder>(firstPageKey: 1);
  final _scrollController = ScrollController();
  bool showBackToTopButton = false;

  late final BoulderBloc _bloc;

  @override
  void initState() {
    _bloc = BoulderBloc(repository: context.read<BoulderRepository>());

    _pagingController.addPageRequestListener((pageKey) {
      _bloc.add(widget.onPageRequested(pageKey));
    });

    _scrollController.addListener(() {
      const showBackToTopButtonOffset = 400;

      if (_scrollController.offset > showBackToTopButtonOffset &&
          !showBackToTopButton) {
        setState(() {
          showBackToTopButton = true;
        });
      } else if (_scrollController.offset < showBackToTopButtonOffset &&
          showBackToTopButton) {
        setState(() {
          showBackToTopButton = false;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomHeaderWidget = widget.bottomHeaderWidget;
    final topHeaderWidget = widget.topHeaderWidget;
    return MultiBlocListener(
      listeners: [
        BlocListener<BoulderFilterBloc, BoulderFilterState>(
          listener: (context, state) {
            _pagingController.refresh();
          },
        ),
        BlocListener<BoulderOrderBloc, ApiOrderParam>(
          listener: (context, state) {
            _pagingController.refresh();
          },
        ),
        BlocListener<BoulderFilterGradeBloc, BoulderFilterGradeState>(
          listener: (context, state) {
            _pagingController.refresh();
          },
        ),
        BlocListener<BoulderBloc, BoulderApiResponse>(
          listener: (context, state) {
            if (state.error != null) {
              _pagingController.error = state.error;
              return;
            } else if (state.data != null) {
              final data = state.data!;
              if (data.nextPage == null) {
                _pagingController.appendLastPage(data.items);
              } else {
                _pagingController.appendPage(data.items, data.nextPage);
              }
              return;
            }
            throw Exception('data or error should be present');
          },
          bloc: _bloc,
        ),
      ],
      child: RefreshIndicator(
        onRefresh: () => Future.sync(_pagingController.refresh),
        child: SafeArea(
          child: Stack(
            children: [
              PagedListView.separated(
                key: const Key('boulder-list-builder-list-view'),
                pagingController: _pagingController,
                scrollController: _scrollController,
                padding: const EdgeInsets.only(
                  bottom: 16,
                  left: 10,
                  right: 10,
                  top: 5,
                ),
                separatorBuilder:
                    (context, index) => const SizedBox(height: 16),
                builderDelegate: PagedChildBuilderDelegate<Boulder>(
                  noItemsFoundIndicatorBuilder:
                      (context) => const EmptyListIndicator(),
                  firstPageErrorIndicatorBuilder:
                      (context) =>
                          ErrorIndicator(onTryAgain: _pagingController.refresh),
                  itemBuilder: (context, boulder, index) {
                    final tile = BoulderListBuilderTile(
                      boulder: boulder,
                      key: Key(boulder.iri),
                      showLocationInfo: widget.showLocationinfo,
                    );
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          children: [
                            if (topHeaderWidget != null) topHeaderWidget,
                            Row(
                              children: [
                                const BoulderListBuilderSortButton(),
                                if (widget.showFilterButton)
                                  const BoulderListBuilderFilterButton(),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: BoulderListBuilderResults(
                                      key: const Key('boulder-list-result'),
                                      totalItems:
                                          _bloc.state.data?.totalItems ?? 0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (bottomHeaderWidget != null) bottomHeaderWidget,
                            const SizedBox(height: 10),
                            tile,
                          ],
                        ),
                      );
                    }
                    return tile;
                  },
                ),
              ),
              if (showBackToTopButton)
                BoulderListBuilderBackToTopButton(
                  onPressed: () {
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.ease,
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
