import 'package:mobx/mobx.dart';
import 'package:my_money/src/modules/register/services/register_service.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {
  RegisterService service = RegisterService();

  late String name;
  late String email;
  late String password;
  late String passwordCheck;

  Future<void> checkData({
    required String nameController,
    required String emailController,
    required String passwordController,
    required String passwordCheckController,
  }) async {
    if (passwordController.compareTo(passwordCheckController) == 0) {
      name = nameController;
      email = emailController;
      password = passwordController;
      await senData();
    } else {
      print("Senha está incorerta");
    }
  }

  Future<void> senData() async {
    await service.sendRegisterData(
      name,
      email,
      password,
    );
  }
}
