import 'package:flutter/material.dart';
import 'package:whatsapp_redesigne/Models/Archive_Model.dart';
import 'package:whatsapp_redesigne/Models/Chat_Model.dart';
import 'package:whatsapp_redesigne/Models/Contact_Model.dart';
import 'package:whatsapp_redesigne/View/Theme/colors.dart';
import 'package:whatsapp_redesigne/View/Widgets/Large_Text.dart';
import 'package:whatsapp_redesigne/View/Widgets/Reguler_Text.dart';

class ArchiveTabView extends StatelessWidget {
  const ArchiveTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(),
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: List.generate(ArchiveData.length, (index) {
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
                          image: NetworkImage(ArchiveData[index]['Image']),
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
                          color: ArchiveData[index]['isOnline']
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
                        data: ArchiveData[index]['name'].toString(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ArchiveData[index]['numberOfmessage'] == 0
                          ? RegularText(
                              Size: 14,
                              color: black,
                              data:
                                  ArchiveData[index]['lastmessage'].toString(),
                            )
                          : LargeText(
                              Size: 14,
                              color: black.withOpacity(0.7),
                              data:
                                  ArchiveData[index]['lastmessage'].toString(),
                            ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RegularText(
                    Size: 13,
                    color: black.withOpacity(0.8),
                    data: ArchiveData[index]['TimeOflastmessage'].toString(),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ArchiveData[index]['numberOfmessage'] != 0
                          ? greenlight
                          : white,
                    ),
                    child: ArchiveData[index]['numberOfmessage'] != 0
                        ? Center(
                            child: LargeText(
                              //isRead
                              Size: 11,
                              color: white,
                              data: ArchiveData[index]['numberOfmessage']
                                  .toString(),
                            ),
                          )
                        : !ArchiveData[index]['isRead']
                            ? Icon(
                                Icons.done_rounded,
                                color: black.withOpacity(0.5),
                                size: 20,
                              )
                            : Icon(
                                Icons.done_all_rounded,
                                color: greenlight,
                                size: 20,
                              ),
                  )
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
