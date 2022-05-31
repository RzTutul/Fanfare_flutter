import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tik_tok_ui/models/upload_content_request.dart';
import 'package:tik_tok_ui/pages/controller/video_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class UploadVideoPage extends StatefulWidget {
  const UploadVideoPage({Key key}) : super(key: key);

  @override
  State<UploadVideoPage> createState() => _UploadVideoPageState();
}

class _UploadVideoPageState extends State<UploadVideoPage> {
  final controller = Get.put(FVideoController());
  Uint8List uint8list;


getVideoImageThumble() async
  {
     uint8list = await VideoThumbnail.thumbnailData(
      video: controller.videopath.value,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 25,
    );
    return uint8list;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVideoImageThumble();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Upload video 2/2"),

        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text(controller.videopath.value),
           // Image.memory(uint8list),

          TextField (
          decoration: InputDecoration(
          border: InputBorder.none,
              labelText: 'Name',
              hintText: 'Name'
          ),
      ),

             TextField (
          decoration: InputDecoration(
          border: InputBorder.none,
              labelText: 'Description',
              hintText: 'Description'
          ),
      ),

              ElevatedButton(
                child: Text("Upload"),
                onPressed: (){
                  UploadContent content = UploadContent(
                    name: "Testing",
                    caption: "Testing perponse",
                    songName: "dafda",
                    profileImg: "a",
                    likes:"10k",
                    comments: "20k",
                    shares: "29k",
                    albumImg: "adsf"

                  );

                  controller.uploadFile(controller.videopath.value, content);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              )
      ],
          ),
        ),
      ),
    );
  }
}


