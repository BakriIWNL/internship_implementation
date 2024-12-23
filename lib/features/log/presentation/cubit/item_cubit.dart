import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemState.initial());

}