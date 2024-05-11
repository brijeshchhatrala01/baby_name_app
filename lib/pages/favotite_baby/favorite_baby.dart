// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../baby_card/name_card.dart';

//favorite baby list page
class FavoriteBaby extends StatefulWidget {
  final String url;
  const FavoriteBaby({super.key, required this.url});

  @override
  State<FavoriteBaby> createState() => _FavoriteBaby();
}

class _FavoriteBaby extends State<FavoriteBaby> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<dynamic>>(
        future: getData(widget.url),
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
      ),
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

    return babyList.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/crying.png',
                  width: 250,
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text('No Baby Name Found'),
            ],
          )
        : CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount: babyList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: ListTile(
                      //to show baby name
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return NameCard(
                                name: babyList[index]['baby_name'],
                                meaning: babyList[index]['meaning'],
                                gender: babyList[index]['gender'],
                                religion: babyList[index]['religion'],
                                isFavorite: babyList[index]['is_favorite']);
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
                              : const Icon(Icons.favorite_border_outlined)),
                      title: Text(babyList[index]['baby_name']),
                      subtitle: Text(babyList[index]['meaning']),
                      //to delete a baby
                      onLongPress: () {
                        setState(() {
                          showDeleteDialog(
                              context, babyList[index]['baby_name']);
                        });
                      },
                    ),
                  );
                },
              )
            ],
          );
  }

  //get data from database
  Future<List<dynamic>> getData(String babyPath) async {
    var resp = await http.get(
      Uri.parse(babyPath),
    );
    var length = jsonDecode(resp.body);

    return jsonDecode(resp.body);
  }
}

//delete baby from database
Future<void> deleteBaby(String baby_name) async {
  var resp = await http.post(
    Uri.parse(
        'https://zoological-wafer.000webhostapp.com/baby_name/deleteBaby.php'),
    body: {
      'baby_name': baby_name,
    },
  );
}

//show dailogue before delete baby to confirm
showDeleteDialog(BuildContext context, String baby_name) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Are You Sure Want To Delete?'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancle')),
          ElevatedButton(
              onPressed: () {
                deleteBaby(baby_name).then((value) => Navigator.pop(context));
              },
              child: const Text('Delete'))
        ],
      );
    },
  );
}
