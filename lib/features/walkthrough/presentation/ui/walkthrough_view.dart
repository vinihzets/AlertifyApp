import 'package:alertifyapp/features/walkthrough/presentation/ui/walkthrough_first_view.dart';
import 'package:alertifyapp/features/walkthrough/presentation/ui/walkthrough_second_view.dart';
import 'package:flutter/material.dart';

class WalkthroughView extends StatefulWidget {
  const WalkthroughView({super.key});

  @override
  State<WalkthroughView> createState() => _WalkthroughViewState();
}

class _WalkthroughViewState extends State<WalkthroughView> {
  int _currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _pages = [
    const WalkThroughFirstView(),
    const WalkthroughSecondView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instruções'),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_currentPage > 0)
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              Text('Page ${_currentPage + 1} of ${_pages.length}'),
              if (_currentPage < _pages.length - 1)
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
