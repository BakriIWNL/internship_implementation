import 'package:hive/hive.dart';
import 'package:itcores_internship_project/features/log/data/model/item_model.dart';
import 'package:itcores_internship_project/features/log/data/repository/item_repository.dart';

class ItemDatasource implements ItemRepository{

  final Box<ItemModel> _itemBox;

  ItemDatasource(this._itemBox);

  @override
  Future<String> addItem({required ItemModel item}) async {
    try {
      await _itemBox.add(item);
      return "Done";
    }
    catch(e){
      return "Error";
    }
    
  }

  @override
  Future<List<ItemModel>> getItems() async {
    try {
      return _itemBox.values.toList();
    }
    catch(e){
      return [];
    }
  }
}