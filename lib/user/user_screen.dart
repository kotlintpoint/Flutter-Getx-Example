import 'package:flutter/material.dart';
import 'package:flutter_getx_example/user/user_controller.dart';
import 'package:get/get.dart';

class UserScreen extends StatelessWidget {

  UserScreen({super.key});

  final UserController controller = Get.put(UserController()); // Dependency Injection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users List (GetX API)")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value, style: TextStyle(color: Colors.red)));
        }
        return ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            var user = controller.users[index];
            return ListTile(
              leading: CircleAvatar(child: Text(user["id"].toString())),
              title: Text(user["name"]),
              subtitle: Text(user["email"]),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.fetchUsers, // Reload Data
        child: Icon(Icons.refresh),
      ),
    );
  }
}
