import 'package:baby_name_app/pages/show_by_religion/show_by_religion.dart';

import 'package:flutter/material.dart';
import 'package:share_it/share_it.dart';

import '../../favotite_baby/favorite_baby.dart';
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
            onTap: () => showReligionDialogue(context),
            leading: Image.asset(
              'assets/images/religion.png',
              width: 28,
              height: 28,
            ),
            title: const Text('R E L I G I O N'),
          ),
          ListTile(
            onTap: () => goToFavorite(context),
            leading: Image.asset(
              'assets/images/favorite.png',
              width: 28,
              height: 28,
            ),
            title: const Text('F A V O R I T'),
          ),
          ListTile(
            onTap: () => shareApp(),
            leading: Image.asset(
              'assets/images/share.png',
              width: 28,
              height: 28,
            ),
            title: const Text('S H A R E'),
          ),
          ListTile(
            onTap: () => showAboutDeveloper(context),
            leading: Image.asset(
              'assets/images/developer.png',
              width: 28,
              height: 28,
            ),
            title: const Text('D E V E L O P E R'),
          ),
        ],
      ),
    );
  }

  Future<void> showReligionDialogue(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Select Any Religion'),
            content: Builder(
              builder: (context) {
                var height = MediaQuery.of(context).size.height;
                return SizedBox(
                  height: height * 0.2,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          goToShowByReligion(context, 'Hindu');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/hindu.png',
                              width: 40,
                              height: 40,
                            ),
                            const Text('Hindu')
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          goToShowByReligion(context, 'Muslim');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/muslim.png',
                              width: 40,
                              height: 40,
                            ),
                            const Text('Muslim')
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          goToShowByReligion(context, 'Sikh');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/sikh.png',
                              width: 40,
                              height: 40,
                            ),
                            const Text('Sikh')
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          goToShowByReligion(context, 'Others');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/others.png',
                              width: 40,
                              height: 40,
                            ),
                            const Text('Others')
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ));
      },
    );
  }

  void goToShowByReligion(BuildContext context, String religion) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShowByReligion(
            url:
                'https://zoological-wafer.000webhostapp.com/baby_name/showBabyByReligion.php?filterword=$religion'),
      ),
    );
  }

  showAboutDeveloper(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AboutDialog(
          applicationIcon: Image.asset(
            'assets/logo.png',
            width: 82,
            height: 82,
          ),
          applicationName: 'Baby Names App',
          applicationVersion: '1.0',
          children: const [
            Text(
                'By Brijesh Chhatrala Developed \nUnder Assesement Programs \nOf Tops Technologies.')
          ],
        );
      },
    );
  }

  shareApp() async {
    ShareIt.text(
      content:
          '\tDownload This App From \n\thttps://github.com/brijeshchhatrala01/baby_name_app',
      androidSheetTitle: 'Share App',
    );
  }
}

goToFavorite(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FavoriteBaby(
          url:
              'https://zoological-wafer.000webhostapp.com/baby_name/favoriteBaby.php',
        ),
      ));
}
