import 'package:flutter/material.dart';

List<DropdownMenuEntry> genderList = const [
    DropdownMenuEntry(value: 'All', label: 'All'),
    DropdownMenuEntry(value: 'Boy', label: 'Boy'),
    DropdownMenuEntry(value: 'Girl', label: 'Girl'),
  ];

  //rashi dropdownmenu list
  List<DropdownMenuEntry> rashiList = const [
    DropdownMenuEntry(value: 'Aries (A,L,E)', label: 'Aries (A,L,E)'),
    DropdownMenuEntry(value: 'Aquaris (G,S)', label: 'Aquaris (G,S)'),
    DropdownMenuEntry(value: 'Capricon (J,K)', label: 'Capricon (J,K)'),
    DropdownMenuEntry(value: 'Cancer (D,H)', label: 'Cancer (D,H)'),
    DropdownMenuEntry(value: 'Gemini (G,K)', label: 'Gemini (G,K)'),
    DropdownMenuEntry(value: 'Leo (M,T)', label: 'Leo (M,T)'),
    DropdownMenuEntry(value: 'Libra (R,T)', label: 'Libra (R,T)'),
    DropdownMenuEntry(value: 'Pisces (C,D,J,T)', label: 'Pisces (C,D,J,T)'),
    DropdownMenuEntry(
        value: 'Sagittarius (B,D,P)', label: 'Sagittarius (B,D,P)'),
    DropdownMenuEntry(value: 'Scorpio (N,Y)', label: 'Scorpio (N,Y)'),
    DropdownMenuEntry(value: 'Taurus (B,U,V)', label: 'Taurus (B,U,V)'),
    DropdownMenuEntry(value: 'Virgo (P,T)', label: 'Virgo (P,T)'),
  ];

  //alphabet dropdownmenu list
  List<DropdownMenuEntry> alphabetList = [
    for (int i = 65; i <= 90; i++) ...[
      DropdownMenuEntry(
          value: String.fromCharCode(i), label: String.fromCharCode(i)),
    ]
  ];

  List<DropdownMenuEntry> religion = [
    DropdownMenuEntry(
      value: "Hindu",
      label: "Hindu",
      trailingIcon: Image.asset(
        'assets/images/hindu.png',
        width: 16,
        height: 16,
      ),
    ),
    DropdownMenuEntry(
      value: "Sikh",
      label: "Sikh",
      trailingIcon: Image.asset(
        'assets/images/sikh.png',
        width: 16,
        height: 16,
      ),
    ),
    DropdownMenuEntry(
      value: "Muslim",
      label: "Muslim",
      trailingIcon: Image.asset(
        'assets/images/muslim.png',
        width: 16,
        height: 16,
      ),
    ),
    DropdownMenuEntry(
      value: "Others",
      label: "Others",
      trailingIcon: Image.asset(
        'assets/images/others.png',
        width: 16,
        height: 16,
      ),
    ),
  ];
