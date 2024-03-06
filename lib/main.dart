import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  get _pages {
    return [
      const MyTabBarView(),
      const Text('Profile'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    const data = 'Tab Controller Test';

    var appBar = AppBar(
      title: const Text(
        data,
      ),
      bottom: const TabBar(
        tabs: [
          Tab(
            icon: Icon(
              Icons.directions_car,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.directions_transit,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.directions_bike,
            ),
          )
        ],
      ),
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                ),
              ),
              ListTile(
                onTap: () {
                  _selectedIndex = 0;
                },
                title: const Text(
                  'Home',
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                title: const Text(
                  'Profile',
                ),
              ),
            ],
          ),
        ),
        body: _pages[_selectedIndex],
        appBar: appBar,
      ),
    );
  }
}

class MyTabBarView extends StatelessWidget {
  const MyTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        Tab(
          icon: Icon(
            Icons.directions_car,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.directions_transit,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.directions_bike,
          ),
        )
      ],
    );
  }
}
