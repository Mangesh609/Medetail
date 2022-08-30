import 'package:flutter/material.dart';
import 'package:medetail/screens/profile_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:medetail/widgets/chewie_list.dart';

import 'home_screen.dart';
class VideoScreen extends StatefulWidget {
  String username="";
  VideoScreen({required this.username}) ;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black45,
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 10, 15, 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,70,0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomeScreen(username:widget.username)), (route) => false);
                  },
                  child: Icon(Icons.home,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,70,0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>VideoScreen(username:widget.username)), (route) => false);
                  },
                  child: Icon(Icons.video_collection_rounded,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,0,40,0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>ProfileScreen(username:widget.username)), (route) => false);
                  },
                  child: Icon(Icons.person,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Basic Medication"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ChewieListItem(
              videoPlayerController: VideoPlayerController.network('https://www.youtube.com/watch?v=XP-4BiWsuaQ'),
              looping: true,
          ),
        ],
      ),
    );
  }
}
