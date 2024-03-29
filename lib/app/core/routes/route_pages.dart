import 'package:get/get.dart';
import 'package:my_list/app/bindings/list_binding.dart';
import 'package:my_list/app/pages/itens/form_itens.dart';
import 'package:my_list/app/pages/itens/itens_page.dart';
import 'package:my_list/app/pages/lists/form_lista_page.dart';

import '../../bindings/item_binding.dart';
import '../../bindings/profile_binding.dart';
import '../../pages/auth/login/login_page.dart';
import '../../pages/auth/register/register_page.dart';
import '../../pages/base_page.dart';
import '../../pages/home/home_page.dart';
import '../../pages/splash_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.base,
      page: () => const BasePage(),
      bindings: [
        ListBinding(),
        ItemBinding(),
        ProfileBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.formList,
      page: () => const FormListPage(),
    ),
    GetPage(
      name: AppRoutes.formItem,
      page: () => FormItensPage(listaId: Get.arguments),
    ),
    GetPage(
      name: AppRoutes.listItem,
      page: () => ItensPage(
          listaId: Get.arguments['listaId'], name: Get.arguments['name']),
    )
  ];
}

abstract class AppRoutes {
  static const String base = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String formList = '/form-list';
  static const String listItem = '/list-item';
  static const String formItem = '/form-item';
}
