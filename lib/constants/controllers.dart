import 'package:get/get.dart';
import 'package:medsquare_web/controllers/menuController.dart';
import 'package:medsquare_web/controllers/navigation_controller.dart';
import 'package:medsquare_web/models/presc.dart';

CustomMenuController menuController = CustomMenuController.instance;
NavigationController navigationController = NavigationController.instance;

// class DropdownController extends GetxController {
//   final selected = ''.obs;
//   List<String> items = ['Tablet', 'Syrup', 'Injection'];

//   void setSelected(String value) {
//     selected.value = value;
//   }
// }

class HomeController extends GetxController {
  var selectedDrowpdown = 'abc';
  List dropdownText = ['abc', 'def', 'ghi'];
}

class Controllerclass extends GetxController {
  final allprescs = <Prescription>[].obs;
  addtotable(c1, c2, c3, type) {
    if (c1.text != '' && c2.text != '' && c3.text != '') {
      allprescs.add(Prescription(
          name: c1.text, duration: c2.text, desc: c3.text, type: type));
      c1.clear();
      c2.clear();
      c3.clear();
    }
  }

  clearrow() {
    allprescs.removeLast();
  }

  cleartable() {
    allprescs.clear();
  }
}
