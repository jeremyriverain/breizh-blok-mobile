import 'package:breizh_blok_mobile/components/modal_closing_button.dart';
import 'package:breizh_blok_mobile/repositories/grade_repository.dart';
import 'package:flutter/material.dart';

import 'package:breizh_blok_mobile/components/boulder_list_filter_grade.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/grade.dart';

class BoulderListFilterModal extends StatelessWidget {
  BoulderListFilterModal({Key? key}) : super(key: key);

  final _gradeRepository = GradeRepository();

  Future<CollectionItems<Grade>> _fetch() {
    return _gradeRepository.findWithBouldersOrderedByName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const ModalClosingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: FutureBuilder(
          future: _fetch(),
          builder: (BuildContext context,
              AsyncSnapshot<CollectionItems<Grade>> snapshot) {
            List<Widget> widgets = [
              const SizedBox(
                height: 20,
              ),
              if (snapshot.hasData && snapshot.data!.totalItems > 1) ...[
                BoulderListFilterGrade(
                  key: const Key('boulder-list-filter-grade'),
                  allGrades: snapshot.data!,
                ),
              ],
            ];

            if (snapshot.hasData || snapshot.hasError) {
              return SafeArea(
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      children: [
                        ...widgets,
                      ],
                    ),
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
