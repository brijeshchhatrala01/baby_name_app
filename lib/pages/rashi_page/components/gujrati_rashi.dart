import 'package:flutter/material.dart';

import '../show_by_rashi.dart';

class GujratiRashi extends StatelessWidget {
  const GujratiRashi({super.key});

  @override
  Widget build(BuildContext context) {
    //list for display gujrati rashi and appropriate images
    List rashiList = [
      ['મેષ (અક્ષરો: અ,લ,ઇ)', 'assets/images/mesh.png'],
      ['વૃષભ (અક્ષરો: બ,વ,ઉ)', 'assets/images/vrishabh.png'],
      ['મિથુન (અક્ષરો: ક,છ,ઘ)', 'assets/images/mithun.png'],
      ['કર્ક (અક્ષરો: ડ,હ)', 'assets/images/kark.png'],
      ['સિંહ (અક્ષરો: મ,ટ)', 'assets/images/sinh.png'],
      ['કન્યા (અક્ષરો: પ,ઠ,ણ)', 'assets/images/kanya.png'],
      ['તુલા (અક્ષરો: ર,ત)', 'assets/images/tula.png'],
      ['વૃશ્ચિક (અક્ષરો: ન,ય)', 'assets/images/vrishchak.png'],
      ['ધનુ (અક્ષરો: ભ,ધ,ફ,ઢ)', 'assets/images/dhanu.png'],
      ['મકર (અક્ષરો: ખ,જ)', 'assets/images/makar.png'],
      ['કુંભ (અક્ષરો: ગ,સ,શ,ષ)', 'assets/images/kumbh.png'],
      ['મીન (અક્ષરો: દ,ચ,થ,ઝ)', 'assets/images/mean.png'],
    ];

    String getRashiHttpUrl(String rashi) {
      switch (rashi) {
        case 'મેષ (અક્ષરો: અ,લ,ઇ)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Aries (A,L,E)';
        case 'વૃષભ (અક્ષરો: બ,વ,ઉ)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Taurus (B,U,V)';
        case 'મિથુન (અક્ષરો: ક,છ,ઘ)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Gemini (G,K)';
        case 'કર્ક (અક્ષરો: ડ,હ)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Cancer (D,H)';
        case 'સિંહ (અક્ષરો: મ,ટ)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Leo (M,T)';
        case 'કન્યા (અક્ષરો: પ,ઠ,ણ)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Virgo (P,T)';
        case 'તુલા (અક્ષરો: ર,ત)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Libra (R,T)';
        case 'વૃશ્ચિક (અક્ષરો: ન,ય)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Scorpio (N,Y)';
        case 'ધનુ (અક્ષરો: ભ,ધ,ફ,ઢ)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Sagittarius (B,D,P)';
        case 'મકર (અક્ષરો: ખ,જ)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Capricon (J,K)';
        case 'કુંભ (અક્ષરો: ગ,સ,શ,ષ)':
          return 'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=Aquaries (G,S)';
        case 'મીન (અક્ષરો: દ,ચ,થ,ઝ)':
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
                      url:getRashiHttpUrl(rashiList[index][0]),
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
