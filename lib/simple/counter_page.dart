import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'counter_controller.dart';

class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  final CounterController controller = Get.put(
    CounterController(),
  ); // Dependency Injection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Counter")),
      body: Center(
        child: GetBuilder<CounterController>(
          builder:
              (controller) => Text(
                "Simple Counter: ${controller.counter}",
                style: TextStyle(fontSize: 24),
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
