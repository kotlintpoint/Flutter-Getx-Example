import 'package:flutter/material.dart';
import 'package:flutter_getx_example/reactive/counter_controller.dart';
import 'package:get/get.dart';

class CounterPage extends StatelessWidget {

  CounterPage({super.key});

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Hybrid Counter")),
      body: Center(
        child: GetX<CounterController>(
          builder: (controller) => Text("Mixing Counter: ${controller.counter}", style: TextStyle(fontSize: 24)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
