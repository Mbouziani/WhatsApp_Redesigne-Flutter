import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatsapp_redesigne/Models/Calls_Model.dart';
import 'package:whatsapp_redesigne/Models/Contact_Model.dart';
import 'package:whatsapp_redesigne/View/Theme/colors.dart';
import 'package:whatsapp_redesigne/View/Widgets/AppbarTitle_Home.dart';
import 'package:whatsapp_redesigne/View/Widgets/ChatTabView.dart';
import 'package:whatsapp_redesigne/View/Widgets/Large_Text.dart';
import 'package:whatsapp_redesigne/View/Widgets/Reguler_Text.dart';
import 'package:whatsapp_redesigne/View/Widgets/TabHeader.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(ContactModel.length, (index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      height: 68,
                      width: 68,
                      decoration: BoxDecoration(
                        color: greenmedium,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                              color: grey,
                              shape: BoxShape.circle,
                              border: Border.all(color: white, width: 2),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      ContactModel[index]['Image']),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    LargeText(
                        Size: 14,
                        color: black.withOpacity(0.8),
                        data: ContactModel[index]['name'])
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
