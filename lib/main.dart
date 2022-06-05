
import 'package:flutter/material.dart';
import 'package:pr1_media_booster_app/screens/assets_audio_page.dart';
import 'package:pr1_media_booster_app/screens/audio_list_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const AudioListPage(),
        'assets_audio_page' : (context) => const AssetsAudioPage(),
      },
    );
  }
}
