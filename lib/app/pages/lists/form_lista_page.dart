import 'package:flutter/material.dart';
import 'package:my_list/app/controllers/list_controller.dart';
import 'package:my_list/app/core/config/app_colors.dart';
import 'package:get/get.dart';

import '../../core/widgets/textfield_widget.dart';

class FormListPage extends StatefulWidget {
  const FormListPage({super.key});

  @override
  State<FormListPage> createState() => _FormListPageState();
}

class _FormListPageState extends State<FormListPage> {
  final ListController controller = Get.find();

  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crie sua lista',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      body: Center(child: GetX<ListController>(builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryLight,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 64),
                      child: Form(
                        key: _formKey,
                        child: TextFieldWidget(
                          controller: nameController,
                          label: 'Nome da lista',
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: SizedBox(
                          height: 32,
                          width: double.infinity,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: AppColors.green,
                            ),
                            onPressed: () {
                              controller.createList(name: nameController.text);
                            },
                            child: const Text('Criar lista',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        );
      })),
    );
  }
}
