
import 'package:flutter/material.dart';
import 'package:video_project/video_list_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late YoutubePlayerController ytController;
  String videoUrl = "https://www.youtube.com/watch?v=UczNUPeTezs";



  @override
  void initState() {

    videoUrl = YoutubePlayer.convertUrlToId(videoUrl)!;
    print(videoUrl); // BBAyRBTfsOU

    super.initState();

    ytController =YoutubePlayerController(
        initialVideoId: videoUrl,
        flags: YoutubePlayerFlags(
          hideControls: false,
          autoPlay: false,
          mute: false,
          disableDragSeek: false,
          loop: false,
          isLive: true,
          forceHD: true,
          enableCaption: true,

        )
    );
  }


  List<String> urls = [
    "https://www.youtube.com/watch?v=eXFr7bGIllU",
    "https://www.youtube.com/watch?v=M0810rvORCI",
    "https://www.youtube.com/watch?v=0RkfhzuGbgw",
    "https://www.youtube.com/watch?v=PwlZYmWWstc",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        title: const Text("Video Project"),
        backgroundColor: Colors.brown.shade300,
        centerTitle: true,
      ),
      body: Padding(

        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: YoutubePlayer(
                controller: ytController,
              
              ),
            ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(ytController.metadata.title,style: TextStyle(color: Colors.black),),
        ),
            Padding(
              padding: const EdgeInsets.only(top:40.0),
              child: GridView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: urls.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1/0.6

                  ),

                  itemBuilder: (context,index){
                  return InkWell(
                      onTap: (){

                        videoUrl = urls[index];
                        final String? videoId = YoutubePlayer.convertUrlToId(videoUrl);
                        ytController.load(videoId!);
                        setState(() {});
                      },

                      child: VideoListWidget(videoUrl: urls[index],));
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}