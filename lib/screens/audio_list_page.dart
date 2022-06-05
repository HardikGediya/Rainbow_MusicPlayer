import 'dart:async';

import 'package:flutter/material.dart';

import '../models/models.dart';

class AudioListPage extends StatefulWidget {
  const AudioListPage({Key? key}) : super(key: key);

  @override
  State<AudioListPage> createState() => _AudioListPageState();
}

class _AudioListPageState extends State<AudioListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (t) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('RAINBOW MUSIC',style: TextStyle(letterSpacing:1.5),),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(right: 18, left: 18),
            child: Column(
              children: audios
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('assets_audio_page');
                        setState(() {
                          audioIndex = audios.indexOf(e);
                          audios.forEach((element) {
                            element.playing = false;
                          });
                          e.playing = !e.playing;
                          assetsAudioPlayer.stop();
                          play = true;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                              color: e.color,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 28,bottom: 28),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 15),
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(e.img!),
                                            radius: 33,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 175,
                                              child: Text(
                                                "${e.title}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    letterSpacing: 1.5,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 175,
                                              child: Text(
                                                "${e.artist}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white.withOpacity(0.8),
                                                  fontSize: 13,
                                                  letterSpacing: 1.5,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children:  [
                                         Padding(
                                           padding: const EdgeInsets.only(right: 8),
                                           child:  (e.playing)
                                                 ? Transform.scale(
                                               scale: 1.3,
                                               child: Image.asset('assets/images/pause.png',scale: 5,),
                                             )
                                                 : Transform.scale(
                                               scale: 1.5,
                                               child: Image.asset('assets/images/play.png',scale: 7,),
                                             ),
                                           ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ));
  }
}
