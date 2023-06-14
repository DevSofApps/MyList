import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_list/app/controllers/list_controller.dart';
import '../lists/form_lista_page.dart';

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
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => FormListPage());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
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
                    return ListTile(
                      title: Text(controllerState.list[index].name ?? ""),
                      subtitle:
                          Text(controllerState.list[index].created_at ?? ""),
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
