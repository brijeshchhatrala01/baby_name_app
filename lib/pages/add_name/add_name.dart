import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../helper_dropdownlist/helper.dart';
import '../model/baby_model.dart';
import 'components/custom_textform.dart';


//page for add name into baby database
class AddName extends StatefulWidget {
  const AddName({super.key});

  @override
  State<AddName> createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
  final nameController = TextEditingController();
  final _meaningController = TextEditingController();

  String genderValue = '';
  String rashiValue = '';
  String religionValue = '';

  //method for add baby data to database
  void addBaby() {
    var url =
        "https://zoological-wafer.000webhostapp.com/baby_name/add_baby.php";
    var baby = BabyModel(
      baby_name: nameController.text,
      meaning: _meaningController.text,
      gender: genderValue,
      religion: religionValue,
      rashi: rashiValue,
      isFavorite: false.toString(),
    );
    http.post(
      Uri.parse(url),
      body: baby.toMap(),
    );
    Navigator.pop(context);
    print('Baby Added!!');
  }

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Baby Names'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 12,
                ),
                //baby name textformfield
                CustomTextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  hintText: 'Enter Baby Name',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/baby_name.png',
                      width: 18,
                      height: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                //baby meaning textformfields
                CustomTextFormField(
                  controller: _meaningController,
                  keyboardType: TextInputType.text,
                  hintText: "Enter Baby Name Meaning",
                  prefixIcon: const Icon(
                    Icons.person_search_outlined,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                //dropdown menu for gender
                DropdownMenu(
                  width: MediaQuery.of(context).size.width - 42,
                  leadingIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/gender.png',
                      width: 16,
                      height: 16,
                    ),
                  ),
                  initialSelection: genderList[1],
                  hintText: "Gender",
                  dropdownMenuEntries: genderList.sublist(1),
                  onSelected: (value) {
                    setState(() {
                      genderValue = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                //dropdownmenu for rashi
                DropdownMenu(
                  width: MediaQuery.of(context).size.width - 42,
                  initialSelection: rashiList[0],
                  leadingIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/rashi.png',
                      width: 16,
                      height: 16,
                    ),
                  ),
                  hintText: "Rashi",
                  dropdownMenuEntries: rashiList,
                  onSelected: (value) {
                    setState(() {
                      rashiValue = value;
                    });
                    //print(religionValue);
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                //dropdown menu for religion
                DropdownMenu(
                  width: MediaQuery.of(context).size.width - 42,
                  hintText: "Religion",
                  initialSelection: religion[0],
                  leadingIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/religion.png',
                      width: 18,
                      height: 18,
                    ),
                  ),
                  dropdownMenuEntries: religion,
                  onSelected: (value) {
                    setState(() {
                      religionValue = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                //A D D Button 
                GestureDetector(
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      addBaby();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blue.shade100, Colors.pink.shade100]),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: Text(
                        'A D D',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
