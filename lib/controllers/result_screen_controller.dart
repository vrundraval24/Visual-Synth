import 'dart:developer';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:vision/controllers/home_screen_controller.dart';
import 'package:vision/core/constants.dart';
import 'package:vision/core/enum.dart';

class ResultScreenController extends GetxController {
  final homeScreenController = Get.find<HomeScreenController>();

  String? result;

  String? speakText;

  RxString selectedLanguage = languages.English.name.obs;

  RxBool isResultLoaded = false.obs;
  RxBool isResponseFailed = false.obs;

  FlutterTts tts = FlutterTts();

  Future<void> speak(String text) async {
    await tts.setLanguage('en-US');
    await tts.setPitch(1);
    await tts.speak(text);
  }

  void openChangeLanguageDialog(){

  }


  Future<void> generateResult() async {
    try {
      speakText = '';
      result = '';
      isResultLoaded.value = false;
      isResponseFailed.value = false;

      String apiKey = Constants.apiKey;

      final model = GenerativeModel(model: 'gemini-pro-vision', apiKey: apiKey);
      final prompt = 'Explain this image in one line. and give response in ${selectedLanguage}.';
      // const prompt = 'Explain this image in one line. and give response in Hindi.';
      // const prompt = 'Explain this image in one line.';
      // const prompt = 'Explain this image in detail with long paragraph.';
      final imageBytes = homeScreenController.image;

      final content = [
        Content.multi([
          TextPart(prompt),
          DataPart('image/png', imageBytes!),
        ])
      ];

      final response = await model.generateContent(content);

      if (response.text != null) {
        result = response.text!.trim();
        isResultLoaded.value = true;
        isResponseFailed.value = false;

        speakText = result;

        speak(speakText!);
      } else {
        isResultLoaded.value = true;
        speakText = "Failed to scan the image.";
        speak(speakText!);
        isResponseFailed.value = true;
      }

      log("Response: ${response.text}");
    } catch (e) {
      isResultLoaded.value = true;
      speakText = "Failed to scan the image.";
      speak(speakText!);
      isResponseFailed.value = true;

      log(e.toString());
    }
  }
}
