import 'package:baby_name_app/pages/add_name/add_name.dart';
import 'package:baby_name_app/pages/baby_card/name_card.dart';
import 'package:baby_name_app/pages/homepage/drawer/custom_nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'filterbar/filter_appbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var showListBy = "All";

  final _searchController = TextEditingController();

  int babyListLength = 0;

  var urlBabyAll =
      'https://zoological-wafer.000webhostapp.com/baby_name/view_baby.php';
  var urlBabySearch =
      'https://zoological-wafer.000webhostapp.com/baby_name/searchBaby.php?filterword=';
  var urlBabyFilterByGender =
      'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByGender.php?filterword=';
  var urlBabyFilterByRashi =
      'https://zoological-wafer.000webhostapp.com/baby_name/filterBabyByRashi.php?filterword=';
  var urlBabyFilterByAlphebet =
      'https://zoological-wafer.000webhostapp.com/baby_name/filterByAlphabet.php?filterword=';

  Future<List<dynamic>> getData(String babyPath) async {
    var resp = await http.get(
      Uri.parse(babyPath),
    );
    var length = jsonDecode(resp.body);
    setState(() {
      babyListLength = length.length;
    });
    return jsonDecode(resp.body);
  }

  Widget setBabyList(Future<List<dynamic>> future) {
    return Expanded(
      child: BabyList(
        future: future,
      ),
    );
  }

  Widget pass() {
    switch (showListBy) {
      case 'searchBaby':
        return setBabyList(
            getData(urlBabySearch + _searchController.text.trim()));
      case 'All':
        return setBabyList(getData(urlBabyAll));
      case 'Boy':
        return setBabyList(getData(urlBabyFilterByGender + showListBy));
      case 'Girl':
        return setBabyList(getData(urlBabyFilterByGender + showListBy));
      case 'Aries (A,L,E)':
        return setBabyList(getData(urlBabyFilterByRashi + showListBy));
      case 'Aquaris (G,S)':
        return setBabyList(getData(urlBabyFilterByRashi + showListBy));
      case 'Capricon (J,K)':
        return setBabyList(getData(urlBabyFilterByRashi + showListBy));
      case 'Cancer (D,H)':
        return setBabyList(getData(urlBabyFilterByRashi + showListBy));
      case 'Gemini (G,K)':
        return setBabyList(getData(urlBabyFilterByRashi + showListBy));
      case 'Leo (M,T)':
        return setBabyList(getData(urlBabyFilterByRashi + showListBy));
      case 'Libra (R,T)':
        return setBabyList(getData(urlBabyFilterByRashi + showListBy));
      case 'Pisces (C,D,J,T)':
        return setBabyList(getData(urlBabyFilterByRashi + showListBy));
      case 'Sagittarius (B,D,P)':
        return setBabyList(getData(urlBabyFilterByRashi + showListBy));
      case 'Scorpio (N,Y)':
        return setBabyList(getData(urlBabyFilterByRashi + showListBy));
      case 'Taurus (B,U,V)':
        return setBabyList(getData(urlBabyFilterByRashi + showListBy));
      case 'Virgo (P,T)':
        return setBabyList(getData(urlBabyFilterByRashi + showListBy));
      case 'A':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'B':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'C':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'D':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'E':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'F':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'G':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'H':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'I':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'J':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'K':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'L':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'M':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'N':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'O':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'P':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'Q':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'R':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'S':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'T':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'U':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'V':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'W':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'X':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'Y':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      case 'Z':
        return setBabyList(getData(urlBabyFilterByAlphebet + showListBy));
      default:
        return setBabyList(getData(urlBabyAll));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text('Baby Names'),
        actions:  [
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () => goToFavorite(context),
            icon: const Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      drawer: const CustomNavDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => goToAddBaby(),
        child: Image.asset(
          'assets/images/baby_name.png',
          width: 42,
          height: 42,
        ),
      ),
      body: Column(
        children: [
          FilterAppBar(
            searchController: _searchController,
            onPressedSearchBaby: () {
              setState(() {
                if (_searchController.text.isNotEmpty) {
                  showListBy = 'searchBaby';
                }
              });
            },
            onSelectedAlphabet: (alphabet) {
              setState(() {
                showListBy = alphabet;
                _searchController.clear();
              });
            },
            onSelectedGender: (gender) {
              setState(() {
                showListBy = gender;
                _searchController.clear();
              });
            },
            onSelectedRashi: (rashi) {
              setState(() {
                showListBy = rashi;
                _searchController.clear();
              });
            },
            totalName: babyListLength,
          ),
          pass()
        ],
      ),
    );
  }

  goToAddBaby() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddName(),
        ));
  }
}

class BabyList extends StatefulWidget {
  final Future<List<dynamic>> future;
  const BabyList({super.key, required this.future});

  @override
  State<BabyList> createState() => _BabyListState();
}

class _BabyListState extends State<BabyList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return _babyListBuilder(babyList: snapshot.data!);
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue.shade500,
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.blue.shade500,
          ),
        );
      },
    );
  }

  Widget _babyListBuilder({required List babyList}) {
    //add or remove favorit baby name
    void toggleFavorite(String baby_name, String is_favorite) async {
      var url = Uri.parse(
        'https://zoological-wafer.000webhostapp.com/baby_name/add_favorite.php',
      );
      var resp = http.post(url, body: {
        'is_favorite': is_favorite,
        'baby_name': baby_name,
      });
      //print('in favorite method');
    }

    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: babyList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return NameCard(
                        name: babyList[index]['baby_name'],
                        meaning: babyList[index]['meaning'],
                        gender: babyList[index]['gender'],
                        religion: babyList[index]['religion'],
                        isFavorite: babyList[index]['is_favorite'],
                      );
                    },
                  );
                },
                tileColor: babyList[index]['gender'] == 'Boy'
                    ? Colors.blue.shade200
                    : Colors.pink.shade200,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      toggleFavorite(
                          babyList[index]['baby_name'],
                          babyList[index]['is_favorite'] == 'false'
                              ? 'true'
                              : 'false');
                    });
                  },
                  icon: babyList[index]['is_favorite'] == "true"
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border_outlined),
                ),
                title: Text(babyList[index]['baby_name']),
                subtitle: Text(babyList[index]['meaning']),
              ),
            );
          },
        )
      ],
    );
  }
}
