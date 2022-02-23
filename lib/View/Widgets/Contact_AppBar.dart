import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatsapp_redesigne/Models/Contact_Model.dart';
import 'package:whatsapp_redesigne/View/Theme/colors.dart';
import 'package:whatsapp_redesigne/View/Widgets/Large_Text.dart';

class ContactAppBar extends StatelessWidget {
  const ContactAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            LargeText(
              Size: 17,
              color: black.withOpacity(0.8),
              data: 'Contact',
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
