import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
bool play = true;
bool shuffle = false;

int audioIndex = 0;

class Audios{

  int? id;
  Color? color;
  String? audio;
  String? img;
  String? title;
  String? artist;
  String? album;
  bool playing = false;

  Audios({
    this.id,
    this.color,
    this.audio,
    this.album,
    this.artist,
    this.title,
    this.img,
    required this.playing,
});

}


List <Audios>audios = <Audios>[
  Audios(
    id: 1,
    title: 'Dekh Lena',
    img: 'assets/images/a1.jpg',
    album: 'Arijit Album',
    artist: 'Arijit Singh',
    audio: 'https://pwdown.com/12075/Dekh%20Lena%20-%20Arijit%20Singh%20-%20320Kbps.mp3',
    color: Colors.red,
    playing: false,
  ),
  Audios(
    id: 2,
    title: 'Srivalli',
    img: 'assets/images/a2.jpg',
    album: 'Pushpa',
    artist: 'Javed Ali',
    audio: 'https://pwdown.com/113563/Srivalli%20-%20Pushpa.mp3',
    color: Colors.orange,
    playing: false,
  ),
  Audios(
    id: 3,
    title: 'Chaand ne Kaho',
    img: 'assets/images/a3.jpg',
    album: 'Chhal jivi Laiye',
    artist: 'Jigardan Gadhvi',
    audio: 'https://pagalworld.nl/files/download/id/26691',
    color: Colors.yellow,
    playing: false,
  ),
  Audios(
    id: 4,
    title: 'Tera Ban Jaunga',
    img: 'assets/images/a4.jpg',
    album: 'Arijit Album',
    artist: 'Tulsi Kumar & Akhil Sachdeva',
    audio: 'https://pwdown.com/14697/Tera%20Ban%20Jaunga%20-%20Kabir%20Singh.mp3',
    color: Colors.green,
    playing: false,
  ),
  Audios(
    id: 5,
    title: 'Yaara - True friends',
    img: 'assets/images/a5.jpg',
    album: 'No.1 Yaari',
    artist: 'Mamta Sharma',
    audio: 'https://pwdown.com/14642/Yaara%20-%20Mamta%20Sharma.mp3',
    color: Colors.blue,
    playing: false,
  ),
  Audios(
    id: 6,
    title: 'Ghungroo',
    img: 'assets/images/a6.jpg',
    album: 'Arijit Best',
    artist: 'Arijit Singh & Shilpha Rao',
    audio: 'https://pwdown.com/113426/Ghungroo%20-%20War.mp3',
    color: Colors.indigo,
    playing: false,
  ),
  Audios(
    id: 7,
    title: 'Pal Pal Dil ke Pass Title Track',
    img: 'assets/images/a7.jpg',
    album: 'Arijit Album',
    artist: 'Parampara Thakur & Arijit Singh',
    audio: 'https://pwdown.com/11437/Pal%20Pal%20Dil%20Ke%20Paas%20-%20Kishore%20Kumar%20190Kbps%20(Original).mp3',
    color: const Color(0xff4b0082),
    playing: false,
  ),
  Audios(
    id: 8,
    title: 'Dil Mein Ho Tum',
    img: 'assets/images/a8.jpg',
    album: 'Best One',
    artist: 'Armaan Malik',
    audio: 'https://pwdown.com/14637/Dil%20Mein%20Ho%20Tum%20-%20Cheat%20India.mp3',
    color: Colors.red,
    playing: false,
  ),
  Audios(
    id: 9,
    title: 'Dheere Dheere',
    img: 'assets/images/a9.jpg',
    album: 'Yo - Yo',
    artist: 'Yo Yo Honey Singh',
    audio: 'https://pwdown.com/8555/Dheere%20Dheere%20(Yo%20Yo%20Honey%20Singh)%20-%20320Kbps.mp3',
    color: Colors.orange,
    playing: false,
  ),
  Audios(
    id: 10,
    title: 'Zindagi Kuch Toh Bata',
    img: 'assets/images/a10.jpg',
    album: 'Pritam Album',
    artist: 'Pritam & Jubin Nautiyal',
    audio: 'https://pwdown.com/9744/06%20Zindagi%20-%20Bajrangi%20Bhaijaan%20(Zubin%20Nautiyal)%20320Kbps.mp3',
    color: Colors.yellow,
    playing: false,
  ),
  Audios(
    id: 11,
    title: 'Unstoppable',
    img: 'assets/images/a11.jpeg',
    album: 'English - album',
    artist: 'Sia',
    audio: 'https://pagaliworld.com/files/download/id/3750',
    color: Colors.green,
    playing: false,
  ),
  Audios(
    id: 12,
    title: 'Humnava Mere',
    img: 'assets/images/a12.jpg',
    album: 'Rock - shiv',
    artist: 'Jubin Nautiyal',
    audio: 'https://pwdown.com/14276/Humnava%20Mere%20-%20Jubin%20Nautiyal.mp3',
    color: Colors.indigo,
    playing: false,
  ),
];