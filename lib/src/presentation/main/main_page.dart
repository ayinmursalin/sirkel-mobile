import 'package:flutter/material.dart';
import 'package:sirkel/src/utils/dialog_util.dart';
import 'package:sirkel/src/presentation/main/home/main_home_page.dart';
import 'package:sirkel/src/presentation/main/profile/main_profile_page.dart';
import 'package:sirkel/src/presentation/main/search/main_search_page.dart';
import 'package:sirkel/theme/common_colors.dart';
import 'package:sirkel/theme/common_icons.dart';
import 'package:sirkel/theme/common_typography.dart';

class MainPage extends StatefulWidget {
  static const route = '/main';

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pages = const [
    MainHomePage(),
    MainSearchPage(),
    MainProfilePage(),
  ];

  var _currentPage = 0;
  var _canPop = false;

  void _onBackPressed(bool didPop) {
    if (_currentPage != 0) {
      setState(() {
        _currentPage = 0;
      });
      return;
    }

    DialogUtil.showToastMessage('Tekan sekali lagi untuk keluar');
    setState(() {
      _canPop = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _canPop = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _canPop && _currentPage == 0,
      onPopInvoked: _onBackPressed,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          onTap: _onPageSelected,
          unselectedLabelStyle: CommonTypography.textTitleSmall,
          selectedLabelStyle: CommonTypography.textTitleSmall,
          unselectedItemColor: CommonColors.black,
          selectedItemColor: CommonColors.deepCerulean,
          items: [
            BottomNavigationBarItem(
              icon: CommonIcons.getIcon(
                'ic_atoms.svg',
                height: 24,
                color: _currentPage == 0 ? CommonColors.deepCerulean : null,
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: CommonIcons.getIcon(
                'ic_search.svg',
                height: 24,
                color: _currentPage == 1 ? CommonColors.deepCerulean : null,
              ),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: CommonIcons.getIcon(
                'ic_profile.svg',
                height: 24,
                color: _currentPage == 2 ? CommonColors.deepCerulean : null,
              ),
              label: 'Akun',
            ),
          ],
        ),
        body: _pages[_currentPage],
      ),
    );
  }

  void _onPageSelected(int index) {
    setState(() {
      _currentPage = index;
    });
  }
}
