import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());
  int selectedDrawerItemIndex = 0;

  void changeSelectedDrawerItem(int index) {
    selectedDrawerItemIndex = index;
    emit(ChangeSelectedDrawerItemState());
  }
}
