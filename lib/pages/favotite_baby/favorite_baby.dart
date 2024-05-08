import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../baby_card/name_card.dart';

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
              ),
            );
          },
        )
      ],
    );
  }

  Future<List<dynamic>> getData(String babyPath) async {
    var resp = await http.get(
      Uri.parse(babyPath),
    );
    var length = jsonDecode(resp.body);

    return jsonDecode(resp.body);
  }
}
