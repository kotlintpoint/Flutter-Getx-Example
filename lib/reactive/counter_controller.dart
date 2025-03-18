import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs; // Rx variable

  void increment() => counter++; // No need for update(), Obx will detect changes
}
