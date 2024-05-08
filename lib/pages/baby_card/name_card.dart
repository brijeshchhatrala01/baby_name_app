import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../homepage/homepage.dart';

class NameCard extends StatefulWidget {
  final String name;
  final String meaning;
  final String gender;
  final String religion;
  final String isFavorite;
  const NameCard(
      {super.key,
      required this.name,
      required this.meaning,
      required this.gender,
      required this.religion,
      required this.isFavorite});

  @override
  State<NameCard> createState() => _NameCardState();
}

class _NameCardState extends State<NameCard> {
  void toggleFavorite(String baby_name, String is_favorite) async {
    var url = Uri.parse(
      'https://zoological-wafer.000webhostapp.com/baby_name/add_favorite.php',
    );
    var resp = http.post(url, body: {
      'is_favorite': is_favorite,
      'baby_name': baby_name,
    });
    print('in favorite method');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      insetAnimationCurve: Curves.fastOutSlowIn,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.name),
          IconButton(
            onPressed: () {
              setState(() {
                toggleFavorite(widget.name,
                    widget.isFavorite == 'false' ? 'true' : 'false');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Homepage(),
                  ),
                );
              });
            },
            icon: widget.isFavorite == 'true'
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Meaning',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            widget.meaning,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 6,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gender',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                'Religion',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.gender,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                widget.religion,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
