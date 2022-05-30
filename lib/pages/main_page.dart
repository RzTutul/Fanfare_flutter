import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Contest",style: TextStyle(fontWeight: FontWeight.bold),),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: [
                        Image.network(
                          'https://yt3.ggpht.com/ytc/AKedOLQsrqHX_dLdWHNZtGm2L3GJ12ipp2LkarOL9LNy1Q=s900-c-k-c0x00ffffff-no-rj',
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: 5,),

                        Container(
                          child: Row(
                            children: [
                              Image.asset("assets/images/icon.png",height: 50,width: 50,),
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
                )
              ],
            ),
          ),
        ),


      ),
    );
  }
}
