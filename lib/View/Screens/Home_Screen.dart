import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_redesigne/View/Screens/Contact_Screen.dart';
import 'package:whatsapp_redesigne/View/Theme/colors.dart';
import 'package:whatsapp_redesigne/View/Widgets/AppbarTitle_Home.dart';
import 'package:whatsapp_redesigne/View/Widgets/ArchiveTabView.dart';
import 'package:whatsapp_redesigne/View/Widgets/CallTabView.dart';
import 'package:whatsapp_redesigne/View/Widgets/ChatTabView.dart';
import 'package:whatsapp_redesigne/View/Widgets/StoryItem.dart';
import 'package:whatsapp_redesigne/View/Widgets/TabHeader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late int currentindex = 1;
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this, initialIndex: 1);
    controller.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    setState(() {
      currentindex = controller.index;

      print(currentindex);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: white,
          elevation: 4,
          shadowColor: black.withOpacity(0.2),
          title: AppBarTitleHome(),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              StoryItem(),
              TabHeader(controller: controller),
              Expanded(
                child: TabBarView(controller: controller, children: [
                  ArchiveTabView(),
                  chatTabView(),
                  CallTabView(),
                ]),
              )
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: FloatingActionButton(
              elevation: 3.5,
              child: Icon(
                Icons.add,
                color: white,
              ),
              backgroundColor: greenlight,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactScreen(),
                    ));
              }),
        ));
  }
}
