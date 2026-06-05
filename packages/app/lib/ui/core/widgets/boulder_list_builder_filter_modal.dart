import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder_filter_grade.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/modal_closing_button.dart';
import 'package:flutter/material.dart';

class BoulderListBuilderFilterModal extends StatelessWidget {
  const BoulderListBuilderFilterModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const ModalClosingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: const Column(
              children: [
                SizedBox(height: 20),
                BoulderListBuilderFilterGrade(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
