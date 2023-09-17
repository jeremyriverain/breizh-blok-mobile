import 'package:flutter_bloc/flutter_bloc.dart';

class TabBloc extends Bloc<TabEvent, int> {
  TabBloc() : super(0) {
    on<TabUpdated>((event, emit) => emit(event.activeTab));
  }
}

abstract class TabEvent {}

class TabUpdated extends TabEvent {
  TabUpdated({
    required this.activeTab,
  });

  final int activeTab;
}
