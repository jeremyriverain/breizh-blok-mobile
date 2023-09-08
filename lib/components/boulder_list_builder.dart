import 'dart:async';

import 'package:breizh_blok_mobile/blocs/boulder_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/components/boulder_list_back_to_top_button.dart';
import 'package:breizh_blok_mobile/components/boulder_list_results.dart';
import 'package:breizh_blok_mobile/components/boulder_list_tile.dart';
import 'package:breizh_blok_mobile/components/empty_list_indicator.dart';
import 'package:breizh_blok_mobile/components/error_indicator.dart';
import 'package:breizh_blok_mobile/components/filter_boulders_button.dart';
import 'package:breizh_blok_mobile/components/sort_boulders_button.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';
import 'package:breizh_blok_mobile/models/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BoulderListBuilder extends StatefulWidget {
  final Function onPageRequested;
  final BoulderFilterBloc boulderFilterBloc;
  final bool showFilterButton;
  final Widget? bottomHeaderWidget;

  const BoulderListBuilder({
    Key? key,
    required this.onPageRequested,
    required this.boulderFilterBloc,
    this.showFilterButton = true,
    this.bottomHeaderWidget,
  }) : super(key: key);

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
    _bloc = BoulderBloc();

    _pagingController.addPageRequestListener((pageKey) {
      _bloc.add(widget.onPageRequested(pageKey));
    });

    _scrollController.addListener(() {
      double showBackToTopButtonOffset = 400.0;

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
    return MultiBlocListener(
      listeners: [
        BlocListener<BoulderFilterBloc, BoulderFilterState>(
          listener: (context, state) {
            _pagingController.refresh();
          },
        ),
        BlocListener<BoulderOrderBloc, OrderQueryParam>(
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
        )
      ],
      child: RefreshIndicator(
        onRefresh: () => Future.sync(
          () {
            _pagingController.refresh();
          },
        ),
        child: SafeArea(
          child: Stack(
            children: [
              PagedListView.separated(
                key: const Key('boulder-list-builder-list-view'),
                pagingController: _pagingController,
                scrollController: _scrollController,
                padding: const EdgeInsets.only(
                    bottom: 16, left: 10, right: 10, top: 5),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                builderDelegate: PagedChildBuilderDelegate<Boulder>(
                  noItemsFoundIndicatorBuilder: (context) =>
                      const EmptyListIndicator(),
                  firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
                    error: _pagingController.error,
                    onTryAgain: () => _pagingController.refresh(),
                  ),
                  itemBuilder: (context, boulder, index) {
                    final tile = BoulderListTile(
                      boulder: boulder,
                      key: Key(boulder.iri),
                    );
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const SortBouldersButton(),
                                if (widget.showFilterButton)
                                  const FilterBouldersButton(),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: BoulderListResults(
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
                            tile
                          ],
                        ),
                      );
                    }
                    return tile;
                  },
                ),
              ),
              if (showBackToTopButton)
                BoulderListBackToTopButton(
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
