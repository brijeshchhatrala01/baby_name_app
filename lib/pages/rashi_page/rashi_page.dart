
import 'package:flutter/material.dart';

import 'components/english_rashi.dart';
import 'components/gujrati_rashi.dart';
import 'components/hindi_rashi.dart';

//rashi tabbar
class RashiPage extends StatelessWidget {
  const RashiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Gujrati',
              ),
              Tab(
                text: 'Hindi',
              ),
              Tab(
                text: 'English',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GujratiRashi(),
            HindiRashi(),
            EnglishRashi(),
          ],
        ),
      ),
    );
  }
}
