import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:my_money/src/modules/register/controller/register_controller.dart';
import 'package:my_money/src/shared/colors/app_colors.dart';
import 'package:my_money/src/shared/components/app_button.dart';
import 'package:my_money/src/shared/components/app_logo_title.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController controller = RegisterController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appPageBackground,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),
      backgroundColor: AppColors.appPageBackground,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 25,
                right: 25,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppLogoTitle(
                    title: 'Cadastro My Money',
                    titleSize: 20,
                    iconSize: 80,
                  ),
                  TextFormField(
                    enabled: true,
                    textAlign: TextAlign.start,
                    autofocus: false,
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration:
                        const InputDecoration(label: Text('Nome Completo')),
                  ),
                  TextFormField(
                    enabled: true,
                    textAlign: TextAlign.start,
                    autofocus: false,
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
                    decoration: const InputDecoration(label: Text('E-mail')),
                  ),
                  TextFormField(
                    enabled: true,
                    textAlign: TextAlign.start,
                    autofocus: false,
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: const InputDecoration(label: Text('Senha')),
                  ),
                  TextFormField(
                    enabled: true,
                    textAlign: TextAlign.start,
                    autofocus: false,
                    controller: passwordCheckController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration:
                        const InputDecoration(label: Text('Confirma a Senha')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: AppButton(
                        action: () async {
                          await controller.checkData(
                              nameController: nameController.text,
                              emailController: emailController.text,
                              passwordController: passwordController.text,
                              passwordCheckController:
                                  passwordCheckController.text);
                        },
                        label: 'Cadastrar'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
