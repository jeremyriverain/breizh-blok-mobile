import 'dart:async';

import 'package:breizh_blok_mobile/blocs/boulder_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:breizh_blok_mobile/models/response.dart';
import 'package:breizh_blok_mobile/presentation/widgets/bb_boulder_list_builder_back_to_top_button.dart';
import 'package:breizh_blok_mobile/presentation/widgets/bb_boulder_list_builder_filter_button.dart';
import 'package:breizh_blok_mobile/presentation/widgets/bb_boulder_list_builder_results.dart';
import 'package:breizh_blok_mobile/presentation/widgets/bb_boulder_list_builder_sort_button.dart';
import 'package:breizh_blok_mobile/presentation/widgets/bb_boulder_list_builder_tile.dart';
import 'package:breizh_blok_mobile/presentation/widgets/bb_empty_list_indicator.dart';
import 'package:breizh_blok_mobile/presentation/widgets/bb_error_indicator.dart';
import 'package:breizh_blok_mobile/repositories/boulder_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BbBoulderListBuilder extends StatefulWidget {
  const BbBoulderListBuilder({
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
  State<StatefulWidget> createState() => _BbBoulderListBuilderState();
}

class _BbBoulderListBuilderState extends State<BbBoulderListBuilder> {
  final _pagingController = PagingController<int, Boulder>(firstPageKey: 1);
  final _scrollController = ScrollController();
  bool showBackToTopButton = false;

  late final BoulderBloc _bloc;

  @override
  void initState() {
    _bloc = BoulderBloc(
      repository: context.read<BoulderRepository>(),
    );

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
        BlocListener<BoulderOrderBloc, OrderParam>(
          listener: (context, state) {
            _pagingController.refresh();
          },
        ),
        BlocListener<BoulderFilterGradeBloc, BoulderFilterGradeState>(
          listener: (context, state) {
            _pagingController.refresh();
          },
        ),
        BlocListener<BoulderBloc, Response<CollectionItems<Boulder>>>(
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
        onRefresh: () => Future.sync(
          _pagingController.refresh,
        ),
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
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                builderDelegate: PagedChildBuilderDelegate<Boulder>(
                  noItemsFoundIndicatorBuilder: (context) =>
                      const BbEmptyListIndicator(),
                  firstPageErrorIndicatorBuilder: (context) => BbErrorIndicator(
                    onTryAgain: _pagingController.refresh,
                  ),
                  itemBuilder: (context, boulder, index) {
                    final tile = BbBoulderListBuilderTile(
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
                                const BbBoulderListBuilderSortButton(),
                                if (widget.showFilterButton)
                                  const BbBoulderListBuilderFilterButton(),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: BbBoulderListBuilderResults(
                                      key: const Key('boulder-list-result'),
                                      totalItems:
                                          _bloc.state.data?.totalItems ?? 0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (bottomHeaderWidget != null) bottomHeaderWidget,
                            const SizedBox(
                              height: 10,
                            ),
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
                BbBoulderListBuilderBackToTopButton(
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
