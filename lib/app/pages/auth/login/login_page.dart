import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/routes/route_pages.dart';
import '../../../core/services/validator.dart';
import '../../../core/widgets/textfield_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final emailTExtController = TextEditingController();
  final passwordTExtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: AppColors.white),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/logoapp.png", scale: 2.5),
                    ],
                  ),
                ),

                // Formulário
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Email
                          TextFieldWidget(
                            controller: emailTExtController,
                            icon: Icons.email,
                            label: 'Email',
                            validator: emailValidator,
                          ),
                          // Senha
                          TextFieldWidget(
                            controller: passwordTExtController,
                            icon: Icons.lock,
                            label: 'Senha',
                            isSecret: true,
                            validator: passwordValidator,
                          ),

                          // Botão de entrar
                          SizedBox(
                            height: 50,
                            child: GetX<AuthController>(builder: (controller) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                onPressed: controller.isLoading.value == true
                                    ? null
                                    : () {
                                        FocusScope.of(context).unfocus();

                                        if (_formKey.currentState!.validate()) {
                                          String email =
                                              emailTExtController.text;
                                          String password =
                                              passwordTExtController.text;
                                          controller.signIn(
                                              email: email, password: password);
                                        }
                                      },
                                child: controller.isLoading.value == true
                                    ? const CircularProgressIndicator(
                                        backgroundColor: AppColors.primaryText)
                                    : const Text(
                                        'ENTRAR',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: AppColors.primaryText),
                                      ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Divisor
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Ou',
                            style: TextStyle(color: AppColors.primaryText)),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                // Botão criar conta
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      side: const BorderSide(
                        width: 2,
                        color: AppColors.primaryText,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(AppRoutes.register);
                    },
                    child: const Text('Criar uma conta',
                        style: TextStyle(
                            fontSize: 18, color: AppColors.primaryText)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
