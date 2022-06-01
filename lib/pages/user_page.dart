import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.update_disabled),text: "Updates",),
              Tab(icon: Icon(Icons.notifications_active),text: "Notification"),
            ],
          ),
          title: Text('Fanfare Demo'),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("No notification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            Center(child: Text("No notification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),

          ],
        ),
      ),
    );
  }
}
