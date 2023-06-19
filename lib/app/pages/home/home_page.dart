import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_list/app/controllers/list_controller.dart';
import '../../core/config/app_colors.dart';
import '../../core/routes/route_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ListController controllerState = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          hoverColor: AppColors.primary,
          onPressed: () async {
            await Get.toNamed(AppRoutes.formList);
            controllerState.getItens();
          },
          child: const Icon(Icons.add)),
      body: RefreshIndicator(
        onRefresh: () async {
          controllerState.getItens();
        },
        child: GetX<ListController>(
          builder: (controllerState) {
            if (controllerState.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (controllerState.list.isNotEmpty) {
                return ListView.builder(
                  itemCount: controllerState.list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: InkWell(
                        onTap: () => {
                          Get.toNamed(
                            AppRoutes.listItem,
                            arguments: {
                              "listaId": controllerState.list[index].id,
                              "name": controllerState.list[index].name
                            },
                          ),
                        },
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
                          child: ListTile(
                            title: Text(
                              controllerState.list[index].name ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryText),
                            ),
                            subtitle: Text(
                                controllerState.list[index].created_at ?? ""),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.more_vert,
                                    color: AppColors.primaryText)),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("Nenhuma lista cadastrada ainda!"),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
