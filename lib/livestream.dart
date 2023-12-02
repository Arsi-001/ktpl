import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:ktpl/Constants.dart';
import 'package:ktpl/homepage.dart';
import 'package:remixicon/remixicon.dart';
import 'package:video_player/video_player.dart';

class LiveStreamVideo extends StatefulWidget {
  const LiveStreamVideo({super.key});

  @override
  State<LiveStreamVideo> createState() => _LiveStreamVideoState();
}

class _LiveStreamVideoState extends State<LiveStreamVideo> {
  VideoPlayerController? _player;
  String Datasource =
      "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8";

  FirebaseFirestore db =  FirebaseFirestore.instance;
  @override
  void initState() {
    // TODO: implement initState

    _player = VideoPlayerController.networkUrl(Uri.parse(Datasource))
      ..initialize().then((_) {
        setState(() {});
      });

    _player!.play();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(120), child: Header()),
      body: Container(
        // decoration: BoxDecoration(
        //     // image: DecorationImage(
        //     //     image: AssetImage("assets/images/bg-badar.jpg"),
        //     //     fit: BoxFit.cover)),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _player!.value.isInitialized
                ? AspectRatio(
                    aspectRatio: 16 / 9,
                    child: VideoPlayer(_player!),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "KTPL season 3: lyari Legends vs Clifton popular ",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            InfoHeading_Icontxt(),
            InfoHeading_Icontxt(),
            InfoHeading_Icontxt(),
            InfoHeading_Icontxt(),
            Row(
              children: [
                SocialBubble(),
                SocialBubble(),
                SocialBubble(),
                SocialBubble(),
                SocialBubble(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SocialBubble extends StatelessWidget {
  const SocialBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: ThemeRed,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Icon(
          Remix.facebook_circle_line,
          color: Colors.white,
        ),
      ),
    );
  }
}

class InfoHeading_Icontxt extends StatelessWidget {
  const InfoHeading_Icontxt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            Remix.user_location_line,
            size: 16,
          ),
          SizedBox(
            width: 5,
          ),
          Text("data")
        ],
      ),
    );
  }
}





// class LiveSteamPage extends StatefulWidget {
//   const LiveSteamPage({super.key});

//   @override
//   State<LiveSteamPage> createState() => _LiveSteamPage();
// }



// class _LiveSteamPage extends State<LiveSteamPage> {
//    VlcPlayerController _videoPlayerController;

//   @override
//   void initState() {
//     super.initState();

//     _videoPlayerController = VlcPlayerController.network(
//         "http://182.184.51.144:8001/hls/btv.m3u8",
//         hwAcc: HwAcc.full,
//         autoPlay: true,
//         options: VlcPlayerOptions());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           appBar: const PreferredSize(
//               preferredSize: Size.fromHeight(120), child: Header()),
//           backgroundColor: Colors.white,
//           body: VlcPlayer(
//             controller: _videoPlayerController,
//             aspectRatio: 16 / 9,
//             placeholder: Center(
//               child: CircularProgressIndicator(),
//             ),
//           )),
//     );
//   }
// }
