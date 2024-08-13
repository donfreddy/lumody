import 'package:flutter/material.dart';
import 'package:lumody/features/account/presentation/screens/account_screen.dart';
import 'package:lumody/features/home/presentation/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  onChangePage(int? index) {
    setState(() {
      currentPageIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        sizing: StackFit.passthrough,
        index: currentPageIndex,
        children: const [
          HomeScreen(),
          Center(
              child: Text(
            'Insights',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          Center(
              child: Text(
            'Calendar',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: onChangePage,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Insights',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
