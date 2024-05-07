import 'package:flutter/material.dart';

import '../../helper_dropdownlist/helper.dart';

class FilterAppBar extends StatelessWidget {
  final Function(dynamic)? onSelectedGender;
  final Function(dynamic)? onSelectedRashi;
  final Function(dynamic)? onSelectedAlphabet;
  const FilterAppBar(
      {super.key,
      required this.onSelectedGender,
      required this.onSelectedRashi,
      required this.onSelectedAlphabet});

  @override
  Widget build(BuildContext context) {
    //get device width
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownMenu(
                  width: width * 0.3,
                  hintText: 'Gender',
                  dropdownMenuEntries: genderList,
                  onSelected: onSelectedGender,
                ),
                DropdownMenu(
                  width: width * 0.3,
                  hintText: 'Rashi',
                  dropdownMenuEntries: rashiList,
                  onSelected: onSelectedRashi,
                ),
                DropdownMenu(
                  hintText: 'Alphabet',
                  width: width * 0.3,
                  dropdownMenuEntries: alphabetList,
                  onSelected: onSelectedAlphabet,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.5,
                  child: TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Search Names',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.4,
                  child: const Text(
                    'Total Names : 0',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}
