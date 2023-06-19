import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/iten_controller.dart';
import '../../core/config/app_colors.dart';
import '../../core/routes/route_pages.dart';

class ItensPage extends StatefulWidget {
  final int listaId;
  final String name;
  const ItensPage({super.key, required this.listaId, required this.name});

  @override
  State<ItensPage> createState() => _ItensPageState();
}

class _ItensPageState extends State<ItensPage> {
  @override
  void initState() {
    Get.find<ItemController>().getItens(widget.listaId);
    super.initState();
  }

  final ItemController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primary,
            hoverColor: AppColors.primary,
            onPressed: () async {
              await Get.toNamed(
                AppRoutes.formItem,
                arguments: widget.listaId,
              );
              controller.getItens(widget.listaId);
            },
            child: const Icon(Icons.add)),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.getItens(widget.listaId);
          },
          child: GetX<ItemController>(
            builder: (controller) {
              // controller.getItens(listaId);
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return controller.listItens.isNotEmpty
                    ? ListView.builder(
                        itemCount: controller.listItens.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primaryLight,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: SizedBox(
                                        child: Row(
                                          children: [
                                            Text(
                                              controller
                                                      .listItens[index].name ??
                                                  "",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.primaryText),
                                            ),
                                            const Spacer(),
                                            Checkbox(
                                              checkColor: Colors.white,
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      AppColors.primary),
                                              shape: const CircleBorder(),
                                              splashRadius: 25,
                                              value: controller.listItens[index]
                                                          .comprado ==
                                                      0
                                                  ? false
                                                  : true,
                                              onChanged: (value) => {
                                                print(value),
                                                controller.listItens[index]
                                                        .comprado =
                                                    value == true ? 1 : 0,
                                                // controller.updateItem(
                                                //     controller.listItens[index])
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                      subtitle: Text(
                                          "quantidade: ${controller.listItens[index].quantidade}"),
                                    ),
                                    // Text(
                                    //   controller.listItens[index].name ?? "",
                                    //   style: const TextStyle(
                                    //       fontSize: 16,
                                    //       fontWeight: FontWeight.w700),
                                    // ),
                                    // const SizedBox(
                                    //   height: 8,
                                    // ),
                                    // Text(
                                    //   controller.listItens[index].quantidade
                                    //       .toString(),
                                    //   style: const TextStyle(
                                    //       fontSize: 14,
                                    //       fontWeight: FontWeight.w400),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text("Nenhum item cadastrado"),
                      );
              }
            },
          ),
        ));
  }
}
