import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision/views/widgets/changeLanguageDialog.dart';

import '../../controllers/result_screen_controller.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final resultScreenController = Get.put(ResultScreenController());

    resultScreenController.generateResult();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "RESULT",
          style: TextStyle(letterSpacing: 5, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Obx(() => Text(
                        'Language: ${resultScreenController.selectedLanguage}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
              ),
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(
                      File(imagePath),
                    ),
                  ),
                ),
              ),
              // Image.file(File(imagePath)),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(
                  () => (resultScreenController.isResultLoaded.value)
                      ? (resultScreenController.isResponseFailed.value)
                          ? const Text("Failed to scan the image.",
                              style: TextStyle(fontSize: 20))
                          : Text(
                              resultScreenController.result!,
                              style: const TextStyle(fontSize: 20),
                            )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.maxFinite,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  showDragHandle: true,

                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  context: context,
                  builder: (context) => chooseLanguageBottomSheet(),
                );
              },
              child: const Text(
                "CHANGE LANGUAGE",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.maxFinite,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                resultScreenController.generateResult();
              },
              child: const Text(
                "GENERATE AGAIN",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.maxFinite,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                resultScreenController.speak(resultScreenController.speakText!);
              },
              child: const Text(
                "SPEAK AGAIN",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
