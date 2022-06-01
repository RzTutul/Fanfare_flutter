import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tik_tok_ui/models/upload_content_request.dart';
import 'package:tik_tok_ui/pages/controller/video_controller.dart';
import 'package:tik_tok_ui/pages/home_page.dart';
import 'package:tik_tok_ui/pages/root_app.dart';
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
  final _formKey = GlobalKey<FormState>();
  var name, description;

  getVideoImageThumble() async {
    uint8list = await VideoThumbnail.thumbnailData(
      video: controller.videopath.value,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128,
      // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
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
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
              /*  Text(controller.videopath.value),*/
                // Image.memory(uint8list),

                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  validator: (value) {
                    if (value != null) {
                      name = value;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Caption",
                    fillColor: Colors.white,

                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
                    // errorText: _validationTextPassword,
                  ),
                  onSaved: (value) {
                    if (value != null) {
                      name = value;
                    }
                    //_signUpController.confirmPassword.value = value!;
                  },
                ),

                TextFormField(
                  minLines: 2,
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value != null) {
                      description = value;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Description",
                    fillColor: Colors.white,

                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
                    // errorText: _validationTextPassword,
                  ),
                  onSaved: (value) {
                    if (value != null) {
                      description = value;
                    }
                    //_signUpController.confirmPassword.value = value!;
                  },
                ),
                ElevatedButton(
                  child: Text("Upload"),
                  onPressed: () async {

                    if (_formKey.currentState.validate()) {
                      UploadContent content = UploadContent(
                          name: name,
                          caption: description,
                          songName: "dafda",
                          profileImg: "a",
                          likes: "10k",
                          comments: "20k",
                          shares: "29k",
                          albumImg: "adsf");

                      BuildContext dialogContext; // <<----

                      AlertDialog alert = AlertDialog(
                        content: Row(children: [
                          CircularProgressIndicator(
                            backgroundColor: Colors.red,
                          ),
                          Container(margin: EdgeInsets.only(left: 7), child: Text("Uploading...")),
                        ]),
                      );
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          dialogContext = context;
                          return alert;
                        },
                      );


                      final result = await controller.uploadFile(
                          controller.videopath.value, content);
                      await controller.getAllContentList();
                      Navigator.of(dialogContext).pop();
                      Get.to(RootApp());

                      print("helooo"+result);
                    }
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
      ),
    );
  }
}
