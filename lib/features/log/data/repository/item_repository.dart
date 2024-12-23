import 'package:itcores_internship_project/features/log/data/model/item_model.dart';

abstract class ItemRepository {

  Future<List<ItemModel>> getItems();

  Future<String> addItem({required ItemModel item});
}