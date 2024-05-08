import 'package:flutter/material.dart';

import '../../rashi_page/rashi_page.dart';

class CustomNavDrawer extends StatelessWidget {
  const CustomNavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/logo.png',
                height: 36,
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/home.png',
              width: 28,
              height: 28,
            ),
            title: const Text('H O M E'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RashiPage(),
              ),
            ),
            leading: Image.asset(
              'assets/images/rashi.png',
              height: 28,
              width: 28,
            ),
            title: const Text('R A S H I'),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/religion.png',
              width: 28,
              height: 28,
            ),
            title: Text('R E L I G I O N'),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/favorite.png',
              width: 28,
              height: 28,
            ),
            title: Text('F A V O R I T'),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/share.png',
              width: 28,
              height: 28,
            ),
            title: Text('S H A R E'),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/developer.png',
              width: 28,
              height: 28,
            ),
            title: Text('D E V E L O P E R'),
          ),
        ],
      ),
    );
  }
}
