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

  var urlBabyAll =
      'https://zoological-wafer.000webhostapp.com/baby_name/view_baby.php';
  var urlBabyBoy =
      'https://zoological-wafer.000webhostapp.com/baby_name/viewBoyBaby.php';
  var urlBabyGirl =
      'https://zoological-wafer.000webhostapp.com/baby_name/viewBabyGirl.php';
  var urlBabyAries =
      'https://zoological-wafer.000webhostapp.com/baby_name/FilterByRashi/ariesList.php';

  Future<List<dynamic>> getData(String babyPath) async {
    var resp = await http.get(
      Uri.parse(babyPath),
    );
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
      case 'All':
        return setBabyList(getData(urlBabyAll));
      case 'Boy':
        return setBabyList(getData(urlBabyBoy));
      case 'Girl':
        return setBabyList(getData(urlBabyGirl));
      case 'Aries (A,L,E)':
        return setBabyList(getData(urlBabyAries));
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
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          FilterAppBar(
            onSelectedAlphabet: (p0) => null,
            onSelectedGender: (gender) {
              setState(() {
                showListBy = gender;
              });
            },
            onSelectedRashi: (rashi) {
              setState(() {
                showListBy = rashi;
              });
            },
          ),
          pass()
        ],
      ),
    );
  }
}

class BabyList extends StatelessWidget {
  final Future<List<dynamic>> future;
  const BabyList({super.key, required this.future});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return _babyListBuilder(babyList: snapshot.data!);
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
      print(baby_name);
      print(is_favorite);
      print('in favorite method');
    }

    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: babyList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: ListTile(
                tileColor: babyList[index]['gender'] == 'Boy'
                    ? Colors.blue.shade200
                    : Colors.pink.shade200,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                trailing: IconButton(
                    onPressed: () {
                      toggleFavorite(
                          babyList[index]['baby_name'],
                          babyList[index]['is_favorite'] == 'false'
                              ? 'true'
                              : 'false');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Homepage(),
                          ));
                    },
                    icon: babyList[index]['is_favorite'] == "true"
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border_outlined)),
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
