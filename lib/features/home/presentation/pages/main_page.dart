import 'package:biemart/features/auth/presentation/pages/profile.dart';
import 'package:biemart/features/auth/presentation/provider/auth/bloc/auth_bloc.dart';
import 'package:biemart/features/home/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  final _pages = [const HomePage(), const ProfilePage()];
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthStates>(
        listener: (context, state) {
          if (state is AuthUserUnauthenticated) {
            Navigator.of(context).popAndPushNamed('/login');
          }
        },
        child: PageView.builder(
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
          itemCount: _pages.length,
          itemBuilder: (context, index) => _pages[index],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: (_currentPageIndex == 0 || _currentPageIndex == 1)
            ? _currentPageIndex
            : 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: 'User',
          )
        ],
        onTap: (value) {
          setState(() {
            _currentPageIndex = value;
            _pageViewController.animateToPage(value,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut);
          });
        },
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }
}
