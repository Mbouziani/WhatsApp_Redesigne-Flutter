import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatsapp_redesigne/Models/Contact_Model.dart';
import 'package:whatsapp_redesigne/View/Theme/colors.dart';
import 'package:whatsapp_redesigne/View/Widgets/AppbarTitle_Home.dart';
import 'package:whatsapp_redesigne/View/Widgets/Contact_AppBar.dart';
import 'package:whatsapp_redesigne/View/Widgets/Large_Text.dart';
import 'package:whatsapp_redesigne/View/Widgets/Reguler_Text.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black.withOpacity(0.8)),
        titleSpacing: 0,
        toolbarHeight: 60,
        backgroundColor: white,
        elevation: 4,
        shadowColor: black.withOpacity(0.2),
        title: ContactAppBar(),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: ListView(
            children: List.generate(
              ContactModel.length,
              (index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      ContactModel[index]['Image']),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 2, color: white),
                                  color: ContactModel[index]['Isonline']
                                      ? greenlight
                                      : Colors.deepOrange,
                                ),
                              ))
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LargeText(
                                Size: 16,
                                color: black.withOpacity(0.8),
                                data: ContactModel[index]['name'].toString(),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RegularText(
                                Size: 14,
                                color: black,
                                data: ContactModel[index]['description']
                                    .toString(),
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: black.withOpacity(0.1)),
                            child: Icon(
                              Icons.message_rounded,
                              color: black.withOpacity(0.8),
                              size: 18,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: black.withOpacity(0.1)),
                            child: Icon(
                              Icons.phone,
                              color: black.withOpacity(0.8),
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
