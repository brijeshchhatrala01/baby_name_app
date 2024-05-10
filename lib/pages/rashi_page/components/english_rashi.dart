import 'package:flutter/material.dart';

import '../show_by_rashi.dart';

//show rashi in English
class EnglishRashi extends StatelessWidget {
  const EnglishRashi({super.key});

  @override
  Widget build(BuildContext context) {
    //list for display English rashi and appropriate images
    List rashiList = [
      ['Aries (A,L,E)', 'assets/images/mesh.png'],
      ['Taurus (B,U,V)', 'assets/images/vrishabh.png'],
      ['Gemini (G,K)', 'assets/images/mithun.png'],
      ['Cancer (D,H)', 'assets/images/kark.png'],
      ['Leo (M,T)', 'assets/images/sinh.png'],
      ['Virgo (P,T)', 'assets/images/kanya.png'],
      ['Libra (R,T)', 'assets/images/tula.png'],
      ['Scorpio (N,Y)', 'assets/images/vrishchak.png'],
      ['Sagittarius (B,D,P)', 'assets/images/dhanu.png'],
      ['Capricon (J,K)', 'assets/images/makar.png'],
      ['Aquaris (G,S)', 'assets/images/kumbh.png'],
      ['Pisces (C,D,J,T)', 'assets/images/mean.png'],
    ];

    //send url according to rashi selected by user
    String getRashiHttpUrl(String rashi) {
      switch (rashi) {
        case 'Aries (A,L,E)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Aries (A,L,E)';
        case 'Taurus (B,U,V)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Taurus (B,U,V)';
        case 'Gemini (G,K)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Gemini (G,K)';
        case 'Cancer (D,H)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Cancer (D,H)';
        case 'Leo (M,T)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Leo (M,T)';
        case 'Virgo (P,T)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Virgo (P,T)';
        case 'Libra (R,T)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Libra (R,T)';
        case 'Scorpio (N,Y)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Scorpio (N,Y)';
        case 'Sagittarius (B,D,P)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Sagittarius (B,D,P)';
        case 'Capricon (J,K)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Capricon (J,K)';
        case 'Aquaris (G,S)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Aquaries (G,S)';
        case 'Pisces (C,D,J,T)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Pisces (C,D,J,T)';
        default:
          return '';
      }
    }
    //show rashi in listview
    return ListView.builder(
      itemCount: rashiList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowByRashi(
                      url: getRashiHttpUrl(rashiList[index][0]),
                    ),
                  ));
             // print(rashiList[index]);
            },
            leading: Image.asset(
              rashiList[index][1],
              width: 35,
              height: 35,
            ),
            titleAlignment: ListTileTitleAlignment.center,
            title: Text(rashiList[index][0]),
          ),
        );
      },
    );
  }
}
