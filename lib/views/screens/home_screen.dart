import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision/controllers/home_screen_controller.dart';
import 'package:vision/views/screens/result_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenController = Get.put(HomeScreenController());

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Visual Synth",
          style: TextStyle(letterSpacing: 5, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Column(
            children: [
              Image.asset('assets/dog.png'),
              const Text("Let us guide you.", style: TextStyle(fontSize: 24),)
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            width: double.maxFinite,
            height: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                homeScreenController.pickImageFromCamera().then((path) {
                  if (path != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(imagePath: path),
                      ),
                    );
                  }
                });
              },
              child: const Text(
                "OPEN CAMERA",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
