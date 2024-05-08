import 'package:flutter/material.dart';

import '../show_by_rashi.dart';

class HindiRashi extends StatelessWidget {
  const HindiRashi({super.key});

  @override
  Widget build(BuildContext context) {
    //list for display gujrati rashi and appropriate images
    List rashiList = [
      ['मेष - अ,ल,इ', 'assets/images/mesh.png'],
      ['वृषभ - ब,व,उ', 'assets/images/vrishabh.png'],
      ['मिथुन - क,छ,घ', 'assets/images/mithun.png'],
      ['कर्क - ड,ह', 'assets/images/kark.png'],
      ['सिंह - म,ट', 'assets/images/sinh.png'],
      ['कन्या - प,ठ,ण', 'assets/images/kanya.png'],
      ['तुला - र,त', 'assets/images/tula.png'],
      ['वृश्चिक - ने,य', 'assets/images/vrishchak.png'],
      ['धनु - भ,ध,फ,ढ', 'assets/images/dhanu.png'],
      ['मकर - ख,ज', 'assets/images/makar.png'],
      ['कुम्भ - ग,स,श,ष', 'assets/images/kumbh.png'],
      ['मीन - द,च,थ,झ', 'assets/images/mean.png'],
    ];

    String getRashiHttpUrl(String rashi) {
      switch (rashi) {
        case 'मेष - अ,ल,इ':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Aries (A,L,E)';
        case 'वृषभ - ब,व,उ':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Taurus (B,U,V)';
        case 'मिथुन - क,छ,घ':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Gemini (G,K)';
        case 'कर्क - ड,ह':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Cancer (D,H)';
        case 'सिंह - म,ट':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Leo (M,T)';
        case 'कन्या - प,ठ,ण':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Virgo (P,T)';
        case 'तुला - र,त':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Libra (R,T)';
        case 'वृश्चिक - ने,य':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Scorpio (N,Y)';
        case 'धनु - भ,ध,फ,ढ':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Sagittarius (B,D,P)';
        case 'मकर - ख,ज':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Capricon (J,K)';
        case 'कुम्भ - ग,स,श,ष':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Aquaries (G,S)';
        case 'मीन - द,च,थ,झ':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Pisces (C,D,J,T)';
        default:
          return '';
      }
    }

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
              print(rashiList[index]);
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
