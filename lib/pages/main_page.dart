import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:tik_tok_ui/pages/controller/category_controller.dart';
import 'package:tik_tok_ui/pages/controller/video_controller.dart';
import 'package:tik_tok_ui/pages/home_page.dart';
import 'package:tik_tok_ui/pages/video_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  final controller = Get.put(FVideoController());
  final cateController = Get.put(CategoryController());
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
                                item.profileImg,
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
                                    Text('${item.caption}'),
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
              Text("Category",style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                height: size.height * 0.26,
                child: Obx(
                    ()=> ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: cateController.catelist.length,
                      itemBuilder: (context,index) {
                        var cat = cateController.catelist[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(cat.cateImage,
                                    fit: BoxFit.fill,
                                    width: size.width * 0.2,
                                    height:  size.height * 0.2,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Center(child: Text(cat.cateName)),

                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ),
              Text("Tranding",style: TextStyle(fontWeight: FontWeight.bold),),
              Obx(
                  ()=> GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        childAspectRatio: 1 / 1.6,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: controller.datalist.length,
                    itemBuilder: (BuildContext ctx, index) {
                      var video = controller.datalist[index];
                      return InkWell(
                        onTap: (){
                          controller.video.value = video;
                          Get.to(VideoPage());
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  video.profileImg,
                                  fit: BoxFit.fill,
                                  height: 200,
                                ),
                                SizedBox(height: 5,),
                                ListTile(
                                  leading:  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      video.profileImg,
                                      fit: BoxFit.fill,
                                      height: 20,
                                      width: 30,
                                    ),
                                  ),
                                  title: Text(video.name),
                                  trailing:Icon( Icons.thumb_up),
                                ),

                              ],
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          margin: EdgeInsets.all(10),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
