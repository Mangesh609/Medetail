import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieListItem extends StatefulWidget {

 late final VideoPlayerController videoPlayerController ;
 late final bool looping;

 ChewieListItem({
 required this.videoPlayerController,required this.looping,
 });
  @override
  State<ChewieListItem> createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  late ChewieController _chewieController;
  @override
  void initState(){
    super.initState();
    _chewieController = ChewieController(

        videoPlayerController: widget.videoPlayerController,
      aspectRatio:16/14,
      allowFullScreen: true,
      autoInitialize: true,

    );
  }
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8),
          child: Chewie(
         controller: _chewieController,
    ),
    );
  }
  @override
  void dispose(){
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
