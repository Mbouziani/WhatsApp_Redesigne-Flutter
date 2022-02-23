import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatsapp_redesigne/Models/Chat_Model.dart';
import 'package:whatsapp_redesigne/Models/Contact_Model.dart';
import 'package:whatsapp_redesigne/View/Theme/colors.dart';
import 'package:whatsapp_redesigne/View/Widgets/Large_Text.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar(
      {Key? key,
      required this.image,
      required this.name,
      required this.isonline})
      : super(key: key);
  final String name;
  final String image;
  final bool isonline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Stack(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: white),
                        color: isonline ? greenlight : Colors.deepOrange,
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: 10,
            ),
            LargeText(
              Size: 16,
              color: black.withOpacity(0.8),
              data: name,
            )
          ]),
          Row(
            children: [
              Icon(
                LineIcons.video,
                size: 22,
                color: black.withOpacity(0.9),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                LineIcons.phone,
                size: 20,
                color: black,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                LineIcons.verticalEllipsis,
                size: 20,
                color: black,
              ),
            ],
          )
        ],
      ),
    );
  }
}
