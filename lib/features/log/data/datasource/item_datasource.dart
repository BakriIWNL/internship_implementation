import 'package:hive/hive.dart';
import 'package:itcores_internship_project/features/log/data/model/item_model.dart';
import 'package:itcores_internship_project/features/log/data/repository/item_repository.dart';

class ItemDatasource implements ItemRepository{
  @override
  Future<String> addItem({required ItemModel item}) async {
    try {
      Box<ItemModel> itemBox = Hive.box<ItemModel>("items");
      await itemBox.add(item);
      return "Done";
    }
    catch(e){
      return "Error";
    }
    
  }

  @override
  Future<List<ItemModel>> getItems() async {
    try {
      Box<ItemModel> itemBox = Hive.box<ItemModel>("items");
      return itemBox.values.toList();
    }
    catch(e){
      return [];
    }
  }
}