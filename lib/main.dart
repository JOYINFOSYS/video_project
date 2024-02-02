import 'package:flutter/material.dart';
import 'package:video_project/home_screen.dart';


void main() {
  runApp(const VideoProject());
}

class VideoProject extends StatelessWidget {
  const VideoProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Project',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}



