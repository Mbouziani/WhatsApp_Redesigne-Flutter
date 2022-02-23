import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatsapp_redesigne/Models/Conversation_Model.dart';
import 'package:whatsapp_redesigne/View/Theme/colors.dart';
import 'package:whatsapp_redesigne/View/Widgets/Chat_AppBar.dart';
import 'package:whatsapp_redesigne/View/Widgets/Large_Text.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({Key? key, required this.image, required this.name})
      : super(key: key);
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.pop(context);
      }),
      child: Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: black.withOpacity(0.8)),
            titleSpacing: 0,
            toolbarHeight: 60,
            backgroundColor: white,
            elevation: 4,
            shadowColor: black.withOpacity(0.2),
            title: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                LargeText(
                  Size: 16,
                  color: black.withOpacity(0.8),
                  data: 'Profil',
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 345,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: greenmedium,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 8,
                            blurRadius: 15,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Container(
                          width: double.infinity,
                          height: 345,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(image),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    LargeText(
                        Size: 28, color: black.withOpacity(0.8), data: name),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Icon(
                                  LineIcons.facebookMessenger,
                                  size: 25,
                                  color: white,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(18),
                                  primary: greenmedium, // <-- Button color
                                  onPrimary: greenmedium, // <-- Splash color
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              LargeText(
                                  Size: 16,
                                  color: greenmedium,
                                  data: 'Message'),
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Icon(
                                  LineIcons.phone,
                                  size: 25,
                                  color: white,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(18),
                                  primary: greenmedium, // <-- Button color
                                  onPrimary: greenmedium, // <-- Splash color
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              LargeText(
                                  Size: 16, color: greenmedium, data: 'Audio'),
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Icon(
                                  LineIcons.video,
                                  size: 25,
                                  color: white,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(18),
                                  primary: greenmedium, // <-- Button color
                                  onPrimary: greenmedium, // <-- Splash color
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              LargeText(
                                  Size: 16, color: greenmedium, data: 'Vedio'),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Divider(
                      color: grey,
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 25),
                      child: Row(
                        children: [
                          Icon(
                            Icons.block_rounded,
                            size: 25,
                            color: Colors.deepOrange,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          LargeText(
                              Size: 16,
                              color: Colors.deepOrange,
                              data: 'Block $name'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 25),
                      child: Row(
                        children: [
                          Icon(
                            Icons.report,
                            size: 25,
                            color: Colors.deepOrange,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          LargeText(
                              Size: 16,
                              color: Colors.deepOrange,
                              data: 'Report $name'),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: LargeText(
                    Size: 16,
                    color: black.withOpacity(0.8),
                    data: 'Powered by Bouziani Mohammed',
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
