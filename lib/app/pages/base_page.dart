import 'package:flutter/material.dart';
import 'package:my_list/app/pages/itens/itens_page.dart';
import 'package:my_list/app/pages/profile/profile_page.dart';

import '../core/config/app_colors.dart';
import 'home/home_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            const HomePage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              pageController.jumpToPage(index);
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.primary,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withAlpha(150),
          items: const [
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.home_outlined),
            //   label: 'Home',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.comment),
              label: 'Listas',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.list_alt),
            //   label: 'Categorias',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
