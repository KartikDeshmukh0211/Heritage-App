import 'package:flutter/material.dart';
import 'package:heritage_app/screens/chatbot.dart';
import 'package:heritage_app/widget/drawers/homescreen_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2; // Track the selected tab index
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.g_translate),
          tooltip: "Translate",
        ),
        title: const Text(
          "HERITAGE APP",
          style: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        elevation: 5,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 25,
            ),
            tooltip: "Search",
          ),
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
            icon: const Icon(
              Icons.menu,
              size: 28,
            ),
            tooltip: "Menu",
          ),
        ],
      ),
      body: const Center(
        child: Text("No data yet"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Allows more than 3 items
        currentIndex: _currentIndex, // Highlight the selected tab
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const ChatbotScreen()));
          }
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy),
            label: 'AI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
        selectedItemColor:
            const Color.fromARGB(255, 225, 68, 20), // Highlighted icon color
        unselectedItemColor:
            const Color.fromARGB(255, 0, 0, 0), // Non-highlighted icon color
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),
        backgroundColor:
            const Color.fromARGB(255, 255, 255, 255), // Bar background color
        elevation: 10, // Shadow for depth effect
        showUnselectedLabels: true,
        iconSize: 26,
      ),
      endDrawer: HomeScreenDrawer(),
    );
  }
}
