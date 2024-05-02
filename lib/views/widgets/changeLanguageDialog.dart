import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision/controllers/result_screen_controller.dart';
import 'package:vision/core/enum.dart';

Widget chooseLanguageBottomSheet() {
  final resultScreenController = Get.find<ResultScreenController>();

  return StatefulBuilder(
    builder: (context, setState) => Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Text(
            'Choose Language',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        RadioListTile<String>(
          value: languages.English.name,
          title: const Text('English'),
          groupValue: resultScreenController.selectedLanguage.value,
          onChanged: (value) {
            resultScreenController.selectedLanguage.value = value!;

            Navigator.pop(context);
            resultScreenController.generateResult();

          },
        ),
        RadioListTile<String>(
          value: languages.Hindi.name,
          title: const Text('Hindi'),
          groupValue: resultScreenController.selectedLanguage.value,
          onChanged: (value) {
            resultScreenController.selectedLanguage.value = value!;

            Navigator.pop(context);
            resultScreenController.generateResult();

          },
        ),
        RadioListTile<String>(
          value: languages.Gujarati.name,
          title: const Text('Gujarati'),
          groupValue: resultScreenController.selectedLanguage.value,
          onChanged: (value) {
            resultScreenController.selectedLanguage.value = value!;

            Navigator.pop(context);

            resultScreenController.generateResult();
          },
        ),

        RadioListTile<String>(
          value: languages.Japanese.name,
          title: const Text('Japanese'),
          groupValue: resultScreenController.selectedLanguage.value,
          onChanged: (value) {
            resultScreenController.selectedLanguage.value = value!;

            Navigator.pop(context);
            resultScreenController.generateResult();

          },
        ),
        RadioListTile<String>(
          value: languages.Chinese.name,
          title: const Text('Chinese'),
          groupValue: resultScreenController.selectedLanguage.value,
          onChanged: (value) {
            resultScreenController.selectedLanguage.value = value!;

            Navigator.pop(context);
            resultScreenController.generateResult();

          },
        ),
        RadioListTile<String>(
          value: languages.Korean.name,
          title: const Text('Korean'),
          groupValue: resultScreenController.selectedLanguage.value,
          onChanged: (value) {
            resultScreenController.selectedLanguage.value = value!;

            Navigator.pop(context);

            resultScreenController.generateResult();
          },
        ),

        RadioListTile<String>(
          value: languages.Arabic.name,
          title: const Text('Arabic'),
          groupValue: resultScreenController.selectedLanguage.value,
          onChanged: (value) {
            resultScreenController.selectedLanguage.value = value!;

            Navigator.pop(context);

            resultScreenController.generateResult();
          },
        ),
        const SizedBox(
          height: 20,
        )
      ],
    ),
  );
}
