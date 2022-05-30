import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tik_tok_ui/pages/controller/video_controller.dart';

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = Get.put(FVideoController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Contest",style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                height: size.height * 0.4,
                child: Obx(
                  ()=> ListView.builder(

                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.datalist.length,
                    itemBuilder: (context,index) {
                      var item = controller.datalist[index];
                      return Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'http://yt3.ggpht.com/ytc/AKedOLQsrqHX_dLdWHNZtGm2L3GJ12ipp2LkarOL9LNy1Q=s900-c-k-c0x00ffffff-no-rj',
                                fit: BoxFit.fill,
                                width: size.width * 0.6,
                                height:  size.height * 0.28,
                              ),
                              SizedBox(height: 5,),

                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/images/icon.png",height: 30,width: 30,),
                                    Text('${item.songName}'),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      );
                    }
                  ),
                ),
              ),
              Text("Contest",style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                height: size.height * 0.4,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context,index) {
                      return Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'http://yt3.ggpht.com/ytc/AKedOLQsrqHX_dLdWHNZtGm2L3GJ12ipp2LkarOL9LNy1Q=s900-c-k-c0x00ffffff-no-rj',
                                fit: BoxFit.fill,
                                width: size.width * 0.6,
                                height:  size.height * 0.28,
                              ),
                              SizedBox(height: 5,),

                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/images/icon.png",height: 30,width: 30,),
                                    Text('Titile'),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      );
                    }
                ),
              ),
              Text("Contest",style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                height: size.height * 0.4,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context,index) {
                      return Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'http://yt3.ggpht.com/ytc/AKedOLQsrqHX_dLdWHNZtGm2L3GJ12ipp2LkarOL9LNy1Q=s900-c-k-c0x00ffffff-no-rj',
                                fit: BoxFit.fill,
                                width: size.width * 0.6,
                                height:  size.height * 0.28,
                              ),
                              SizedBox(height: 5,),

                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/images/icon.png",height: 30,width: 30,),
                                    Text('Titile'),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      );
                    }
                ),
              ),
              Text("Contest",style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                height: size.height * 0.4,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context,index) {
                      return Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'http://yt3.ggpht.com/ytc/AKedOLQsrqHX_dLdWHNZtGm2L3GJ12ipp2LkarOL9LNy1Q=s900-c-k-c0x00ffffff-no-rj',
                                fit: BoxFit.fill,
                                width: size.width * 0.6,
                                height:  size.height * 0.28,
                              ),
                              SizedBox(height: 5,),

                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/images/icon.png",height: 30,width: 30,),
                                    Text('Titile'),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      );
                    }
                ),
              ),
              Text("Contest",style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                height: size.height * 0.4,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context,index) {
                      return Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'http://yt3.ggpht.com/ytc/AKedOLQsrqHX_dLdWHNZtGm2L3GJ12ipp2LkarOL9LNy1Q=s900-c-k-c0x00ffffff-no-rj',
                                fit: BoxFit.fill,
                                width: size.width * 0.6,
                                height:  size.height * 0.28,
                              ),
                              SizedBox(height: 5,),

                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/images/icon.png",height: 30,width: 30,),
                                    Text('Titile'),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
