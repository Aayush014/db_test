import 'package:db_test/Helper/data_base_helper.dart';
import 'package:get/get.dart';

class DataBaseController extends GetxController {
  void generateDB() {
    DataBaseHelper.dataBaseHelper.generateDataBase();
  }

  @override
  void onInit() {
    generateDB();
    super.onInit();
  }

  void addData (){
    DataBaseHelper.dataBaseHelper.addItem();
  }
}
