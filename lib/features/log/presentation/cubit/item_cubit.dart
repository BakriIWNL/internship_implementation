import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';
import 'package:itcores_internship_project/features/log/data/model/item_model.dart';
import 'package:itcores_internship_project/features/log/data/repository/item_repository.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  final ItemRepository _itemRepository;

  ItemCubit(this._itemRepository) : super(const ItemState(state: GenericStates.initial, items: []));

  String categoryValue = "0";
  String walletValue = "0";
  TextEditingController nameController = TextEditingController();

  void dispose() {
    nameController.dispose();
  }

  void updateCategoryDropDown(String? newVal){
    emit(state.copyWith(state: GenericStates.loading));
    categoryValue = newVal!;
    emit(state.copyWith(state: GenericStates.success));
  }
  
  void updateWalletDropDown(String? newVal){
    emit(state.copyWith(state: GenericStates.loading));
    walletValue = newVal!;
    emit(state.copyWith(state: GenericStates.success));
  }

  Future<List<ItemModel>> getItems() async {
    emit(state.copyWith(state: GenericStates.loading));
    try {
      final items = await _itemRepository.getItems();
      emit(state.copyWith(state: GenericStates.success,items: items));
      return items;
    } catch (e) {
      emit(state.copyWith(state: GenericStates.error));
      return [];
    }
  }

  Future<void> addItem(ItemModel item) async {
    emit(state.copyWith(state: GenericStates.loading));
    try {
      final result = await _itemRepository.addItem(item: item);
      if (result == "Done") {
        emit(state.copyWith(state: GenericStates.success ,items: await _itemRepository.getItems())); 
      } else {
        emit(state.copyWith(state: GenericStates.error));
      }
    } catch (e) {
      emit(state.copyWith(state: GenericStates.error));
    }
  }
}