import 'package:alertifyapp/features/home/presentation/ui/home_view.dart';
import 'package:alertifyapp/features/settings/presentation/ui/settings_view.dart';
import 'package:alertifyapp/features/users/presentation/ui/users_view.dart';
import 'package:alertifyapp/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeUsersView extends StatefulWidget {
  const HomeUsersView({super.key});

  @override
  State<HomeUsersView> createState() => _HomeUsersViewState();
}

class _HomeUsersViewState extends State<HomeUsersView> {
  late PageController _pageController;
  late ThemeState theme;
  int _page = 0;

  @override
  void initState() {
    _pageController = PageController();
    theme = GetIt.I.get();

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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Permissions',
            ),
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
          HomeView(),
          SettingsView(),
        ],
      ),
    );
  }
}
