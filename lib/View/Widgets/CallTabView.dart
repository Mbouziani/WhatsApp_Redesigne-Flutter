import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatsapp_redesigne/Models/Calls_Model.dart';
import 'package:whatsapp_redesigne/Models/Chat_Model.dart';
import 'package:whatsapp_redesigne/Models/Contact_Model.dart';
import 'package:whatsapp_redesigne/View/Theme/colors.dart';
import 'package:whatsapp_redesigne/View/Widgets/Large_Text.dart';
import 'package:whatsapp_redesigne/View/Widgets/Reguler_Text.dart';

class CallTabView extends StatelessWidget {
  const CallTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(),
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: List.generate(CallData.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
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
                          image: NetworkImage(CallData[index]['Image']),
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
                          color: CallData[index]['isOnline']
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
                        data: CallData[index]['name'].toString(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CallData[index]['isRead']
                          ? RegularText(
                              Size: 14,
                              color: black,
                              data: CallData[index]['Description'].toString(),
                            )
                          : LargeText(
                              Size: 14,
                              color: black.withOpacity(0.7),
                              data: CallData[index]['Description'].toString(),
                            ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RegularText(
                      Size: 13,
                      color: black.withOpacity(0.8),
                      data: CallData[index]['TimeOflastCall'].toString(),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      height: 22,
                      width: 22,
                      child: CallData[index]['isVedio']
                          ? Icon(
                              Icons.missed_video_call_rounded,
                              color: !CallData[index]['isRead']
                                  ? greenlight
                                  : black.withOpacity(0.4),
                              size: 25,
                            )
                          : Icon(
                              Icons.phone,
                              color: !CallData[index]['isRead']
                                  ? greenlight
                                  : black.withOpacity(0.4),
                              size: 22,
                            ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
