import 'package:alertifyapp/features/home/presentation/ui/home_view.dart';
import 'package:alertifyapp/features/users/presentation/ui/users_view.dart';
import 'package:flutter/material.dart';

class HomeAdminView extends StatefulWidget {
  const HomeAdminView({super.key});

  @override
  State<HomeAdminView> createState() => _HomeAdminViewState();
}

class _HomeAdminViewState extends State<HomeAdminView> {
  late PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          onTap: (p) {
            _pageController.animateToPage(p,
                duration: const Duration(seconds: 1), curve: Curves.ease);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'Users'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          ]),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (p) {
          setState(() {
            _page = p;
          });
        },
        children: const [
          UsersView(),
          HomeView(),
          // HomeView(),
        ],
      ),
    );
  }
}
