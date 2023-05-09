
import 'package:asasa_estate/Screens/Complete_Inventory/completeInventoryService.dart';

import 'package:rxdart/rxdart.dart';
import '../../AppLayer/Networking/apis_services.dart';
import '../Auth/Myvalidation.dart';
import 'completeInventoryModel.dart';

class CompleteInventoryManager with Myvalidation {
  //late CompleteInventroyModel completeInventoryModel = CompleteInventroyModel(success: true, data: [],);
  ApiService? apiService;

  CompleteInventoryManager({this.apiService});
  final BehaviorSubject<List<CompleteInventroyModel>> _main =
  BehaviorSubject<List<CompleteInventroyModel>>();

  Stream<List<CompleteInventroyModel>> get mainList async* {
    CompleteInventoryService completeInventoryService =
    CompleteInventoryService();
    yield await CompleteInventoryService.browse();
  }

  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
