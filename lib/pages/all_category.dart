import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/category_controller.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({Key key}) : super(key: key);

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  final cateController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      body:
        Container(
          child:   Obx(
                ()=>cateController.catelist.isNotEmpty? GridView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                    mainAxisExtent: 200
                  ),
                itemCount: cateController.catelist.length,
                itemBuilder: (BuildContext ctx, index) {
                  var cat = cateController.catelist[index];

                  return   Padding(
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
                }): Center(
                  child: CircularProgressIndicator(),
                ),
          ),
          ),
        ),
    );
  }
}
