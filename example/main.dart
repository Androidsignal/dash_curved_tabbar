import 'package:dash_curved_tabBar/dash_curved_tab_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: DashCurvedTabBar(
        //     tabs: ["Products", "Details", "Features"],
        //     selectedIndex: selectedIndex,
        //     onTap: (i) => setState(() => selectedIndex = i
        // ),
        // ),
        child: DashCurvedTabBar(
          tabs: ["Products", "Details", "Features"],
          selectedIndex: selectedIndex,
          onTap: (i) => setState(() => selectedIndex = i),
          badgeCountList: [3, 0, 0],
          badgeSize: 20,
          badgeOffset: const Offset(-8, -15),
          badgeColor: Colors.blue,
          badgeTextStyle: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          icons: [
            Icon(
              Icons.shopping_bag,
              color: selectedIndex == 0 ? Colors.white : Colors.blue,
            ),
            Icon(
              Icons.info,
              color: selectedIndex == 1 ? Colors.white : Colors.black,
            ),
            Icon(
              Icons.star,
              color: selectedIndex == 2 ? Colors.white : Colors.black,
            ),
          ],
          iconPosition: IconPosition.top,
          // selectedTabColor: Colors.grey,
          selectedTabTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          unselectedTabTextStyle: const TextStyle(
            color: Colors.blue,
            fontSize: 14,
          ),
          hideBorders: true,
          hideTabText: true,

          // tabContentColor: Colors.black,
          showDivider: false,
          tabBarHeight: 60,
          tabContent: [
            Center(
                child: Text('Products Page',
                    style: TextStyle(fontSize: 24,color: Colors.white),
                )
            ),
            Center(
                child: Text('Details Page',
                    style: TextStyle(fontSize: 24,color: Colors.white),
                )
            ),
            Center(
                child: Text('Features Page',
                    style: TextStyle(fontSize: 24,color: Colors.white),
                )
            ),
          ],
        ),
      ),
    );
  }
}
