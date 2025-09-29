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
      backgroundColor: Colors.white,
      body: Center(
        child: DashCurvedTabBar(
          // Required: the visible tab labels.
          tabs: ["Products", "Details", "Features"],

          // Currently selected tab index.
          selectedIndex: selectedIndex,

          // Called when a tab is tapped.
          onTap: (i) => setState(() => selectedIndex = i),

          //show numeric badges on tabs (same length as tabs ideally).
          badgeCountList: [3, 0, 0],

          //  size of badge
          badgeSize: 20,

          // Where the badge is positioned relative to the tab button
          badgeOffset: const Offset(-8, -15),

          // Badge background color
          badgeColor: Colors.black,

          // Badge text style
          badgeTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),

          // Icons for each tab.their color is set here based on selectedIndex.
          icons: [
            Icon(
              Icons.shopping_bag,
              color: selectedIndex == 0 ? Colors.white : Colors.black,
            ),
            Icon(
              Icons.info,
              color: selectedIndex == 1 ? Colors.white : Colors.black,
            ),
            Icon(
              Icons.shopping_cart_rounded,
              color: selectedIndex == 2 ? Colors.white : Colors.black,
            ),
          ],

          // Where the icon is placed relative to the text label (top,bottom,left,right)
          iconPosition: IconPosition.top,

          // Styling for selected tab text (used only if hideTabText == false)
          selectedTabTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),

          // Styling for unselected tab text (used only if hideTabText == false)
          unselectedTabTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),

          // Hide outer border around the whole tab bar container
          hideBorders: true,

          // If true, tab labels (text) are hidden and only icons are shown
          hideTabText: true,

          // Whether to show a thin divider line between the tab bar and tab content
          showDivider: true,

          // Height of the tab bar (controls tap area too)
          tabBarHeight: 60,

          // Content widgets displayed below the tab bar (connected tab content).
          // The content at index i corresponds to tabs[i].
          tabContent: [
            Center(
              child: Text(
                'Check out our latest collection of products.High-quality items at amazing prices.Scroll down to explore our popular picks!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                'Our products are designed with quality, durability, and style in mind. Each item undergoes strict quality checks to ensure premium performance and long-lasting satisfaction. Explore the main features below to understand what makes our products stand out in the market.',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                'Discover the key features that make our products stand out. Designed for performance, reliability, and style, each feature ensures that you get the best experience possible. From fast performance to smart connectivity, explore the benefits below.',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
