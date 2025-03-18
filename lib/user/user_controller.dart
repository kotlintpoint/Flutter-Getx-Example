import 'package:flutter_getx_example/services/api_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var users = [].obs; // Reactive List
  var isLoading = true.obs; // Loading State
  var errorMessage = ''.obs; // Error Handling

  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    fetchUsers(); // Call API when controller initializes
    super.onInit();
  }

  /// Fetch Users with API Call
  void fetchUsers() async {
    try {
      isLoading(true);
      var userData = await _apiService.fetchUsers();
      users.value = userData; // Update list
    } catch (e) {
      errorMessage.value = e.toString(); // Handle error
    } finally {
      isLoading(false); // Stop loading
    }
  }
}
