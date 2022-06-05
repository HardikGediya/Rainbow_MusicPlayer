import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class AssetsAudioPage extends StatefulWidget {
  const AssetsAudioPage({Key? key}) : super(key: key);

  @override
  State<AssetsAudioPage> createState() => _AssetsAudioPageState();
}

class _AssetsAudioPageState extends State<AssetsAudioPage> {
  String totalDuration = "00.00.00";
  String currentPosition = "00.00.00";

  double totalDurationInSeconds = 0;
  double currentPositionInSeconds = 0;

  double volume = 1;
  bool vol = true;

  int i = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 100), (t) {
      play = assetsAudioPlayer.isPlaying.value;
      setState(() {});
    });

    assetsAudioPlayer.open(
      Playlist(
        startIndex: audioIndex,
        audios: audios
            .map(
              (e) => Audio.network(
                '${e.audio}',
                metas: Metas(
                  title: e.title,
                  artist: e.artist,
                  album: e.album,
                  image:
                      MetasImage.asset("${e.img}"), //can be MetasImage.network
                ),
              ),
            )
            .toList(),
      ),
      showNotification: true,
      autoStart: true,
    );

    assetsAudioPlayer.current.listen((Playing? playing) {
      setState(() {
        totalDuration =
            "${playing!.audio.duration.toString().split(":")[1]}:${playing.audio.duration.toString().split(":")[2].split(".")[0]}";
        totalDurationInSeconds = playing.audio.duration.inSeconds.toDouble();
      });
    });

    assetsAudioPlayer.currentPosition.listen((Duration duration) {
      setState(() {
        currentPosition =
            "${duration.toString().split(":")[1]}:${duration.toString().split(":")[2].split(".")[0]}";
        currentPositionInSeconds = duration.inSeconds.toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Now Playing'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(audios[audioIndex].img!),
              fit: BoxFit.cover,
              opacity: 0.5,
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 75),
                  Center(
                    child: Container(
                      height: 275,
                      width: 275,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 20.0,
                              spreadRadius: 3.0,
                            ), //BoxShadowBoxShadow
                          ],
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(audios[audioIndex].img!),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Center(
                      child: Container(
                    alignment: Alignment.center,
                    width: 300,
                    child: Text(
                      '${audios[audioIndex].title}',
                      style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.1,
                      ),
                    ),
                  )),
                  const SizedBox(height: 10),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: 300,
                      child: Text(
                        '${audios[audioIndex].artist}',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.8),
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            assetsAudioPlayer.stop();
                            play = false;
                          });
                        },
                        icon: const Icon(
                          Icons.stop,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (play == true) {
                              assetsAudioPlayer.pause();
                              play = false;
                            } else {
                              assetsAudioPlayer.play();
                              play = true;
                            }
                          });
                        },
                        icon: (play)
                            ? Transform.scale(
                                scale: 1.3,
                                child: Image.asset('assets/images/pause.png'),
                              )
                            : Transform.scale(
                                scale: 1.5,
                                child: Image.asset('assets/images/play.png'),
                              ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            vol = !vol;
                            if (vol == true) {
                              assetsAudioPlayer.setVolume(1);
                              vol == false;
                            } else {
                              assetsAudioPlayer.setVolume(0);
                              vol == true;
                            }
                          });
                        },
                        icon: (vol)
                            ? const Icon(
                                Icons.headphones,
                                size: 40,
                                color: Colors.white,
                              )
                            :  Icon(
                                Icons.headphones_outlined,
                                size: 40,
                                color: Colors.white.withOpacity(0.7),
                              ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Slider(
                    thumbColor: audios[audioIndex].color,
                    activeColor:  audios[audioIndex].color,
                    inactiveColor: Colors.white,
                    value: currentPositionInSeconds,
                    min: 0,
                    max: totalDurationInSeconds,
                    onChanged: (val) {
                      setState(() {
                        currentPositionInSeconds = val;
                        assetsAudioPlayer.seek(Duration(seconds: val.toInt()));
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "$currentPosition / $totalDuration ",
                    style: const TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
