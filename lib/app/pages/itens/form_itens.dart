import 'package:flutter/material.dart';
import 'package:my_list/app/controllers/iten_controller.dart';
import 'package:my_list/app/core/config/app_colors.dart';
import 'package:get/get.dart';

import '../../core/widgets/textfield_widget.dart';

class FormItensPage extends StatelessWidget {
  final int listaId;
  FormItensPage({super.key, required this.listaId});

  final ItemController controller = Get.find();

  final nameController = TextEditingController();

  final quantidadeController = TextEditingController();

  final precoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Criar Item',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
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
                      child: Column(
                        children: [
                          TextFieldWidget(
                            controller: nameController,
                            label: 'Nome',
                          ),
                          TextFieldWidget(
                            controller: precoController,
                            textInputType: TextInputType.number,
                            label: 'Preço',
                          ),
                          TextFieldWidget(
                            controller: quantidadeController,
                            textInputType: TextInputType.number,
                            label: 'Quantidade',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: Obx(() {
                        return SizedBox(
                          height: 32,
                          width: double.infinity,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: AppColors.green,
                            ),
                            onPressed: controller.isLoading.value == true
                                ? null
                                : () {
                                  print("{listaId} - ${quantidadeController.text}");
                                    controller.createItem(
                                        name: nameController.text,
                                        lista_id: listaId,
                                        quantidade: int.parse(
                                            quantidadeController.text),
                                        preco: num.parse(
                                            precoController.text));
                                  },
                            child: controller.isLoading.value == true
                                ? const CircularProgressIndicator()
                                : const Text('Salvar',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                          ),
                        );
                      })),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
