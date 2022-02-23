import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatsapp_redesigne/Models/Contact_Model.dart';
import 'package:whatsapp_redesigne/View/Theme/colors.dart';
import 'package:whatsapp_redesigne/View/Widgets/Large_Text.dart';

class AppBarTitleHome extends StatelessWidget {
  const AppBarTitleHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/what.png'))),
            ),
            SizedBox(
              width: 10,
            ),
            LargeText(
              Size: 17,
              color: black.withOpacity(0.8),
              data: 'WhatsApp',
            )
          ]),
          Row(
            children: [
              Icon(
                LineIcons.search,
                size: 25,
                color: black,
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: NetworkImage(profileimg))),
              )
            ],
          )
        ],
      ),
    );
  }
}
