import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import '../homepage/homepage.dart';

//splash screen
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    //check user connectivity when app start
    checkConnectivity();
  }

  //navigate to home page after 3 second
  navigateToHome() {
    // ignore: unused_local_variable
    Timer timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Homepage(),
        ),
      );
    });
  }

  //show dailogue if network not available
  showNetworkDialouge() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.error),
              Text('Network  Error'),
            ],
          ),
          content: const Text('Please Check Your Internet Connection'),
          actions: [
            ElevatedButton(onPressed: () => exit(0), child: const Text('Exit'))
          ],
        );
      },
    );
  }

  //check user;s network availablity
  checkConnectivity() async {
    var connection = await Connectivity().checkConnectivity();

    if (connection == ConnectivityResult.mobile) {
      navigateToHome();
    } else if (connection == ConnectivityResult.wifi) {
      navigateToHome();
    } else {
      showNetworkDialouge();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
