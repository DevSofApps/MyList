import 'package:flutter/material.dart';
import 'package:my_list/app/core/widgets/textfield_widget.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/services/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailTExtController = TextEditingController();
  final passwordTExtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldWidget(
                    icon: Icons.person,
                    label: "Email",
                    controller: emailTExtController,
                    validator: emailValidator,
                  ),
                  TextFieldWidget(
                    icon: Icons.person,
                    label: "password",
                    controller: passwordTExtController,
                    validator: passwordValidator,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () => {},
                    child: true
                        ? const CircularProgressIndicator(
                            backgroundColor: Colors.white)
                        : const Text(
                            'ENTRAR',
                            style: TextStyle(fontSize: 18),
                          ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
