import 'package:flutter/material.dart';
import 'package:whatsapp_redesigne/Models/Archive_Model.dart';
import 'package:whatsapp_redesigne/Models/Calls_Model.dart';
import 'package:whatsapp_redesigne/Models/Chat_Model.dart';
import 'package:whatsapp_redesigne/Models/Contact_Model.dart';
import 'package:whatsapp_redesigne/View/Theme/colors.dart';
import 'package:whatsapp_redesigne/View/Widgets/Large_Text.dart';

class TabHeader extends StatefulWidget {
  TabHeader({
    required this.controller,
    Key? key,
  }) : super(key: key);
  final TabController? controller;

  @override
  State<TabHeader> createState() => _TabHeaderState();
}

class _TabHeaderState extends State<TabHeader> {
  @override
  void initState() {
    GetNumberOfMessagUnread();
    super.initState();
  }

  int UnreadMessageInArchive = 0;
  int UnreadMessageInChat = 0;
  int UnreadCall = 0;
  GetNumberOfMessagUnread() {
    for (int i = 0; i < ChatData.length; i++) {
      ChatData[i]['numberOfmessage'] != 0
          ? UnreadMessageInChat++
          : UnreadMessageInChat;
    }
    for (int i = 0; i < ArchiveData.length; i++) {
      ArchiveData[i]['numberOfmessage'] != 0
          ? UnreadMessageInArchive++
          : UnreadMessageInArchive;
    }
    for (int i = 0; i < CallData.length; i++) {
      !CallData[i]['isRead'] ? UnreadCall++ : UnreadCall;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 15.0),
      child: TabBar(
          indicatorWeight: 2.5,
          controller: widget.controller,
          onTap: (value) {
            print(value);
          },
          indicatorColor: greenmedium,
          indicatorPadding: EdgeInsetsDirectional.only(end: 85.0, start: 15.0),
          tabs: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Tab(
                  child: LargeText(
                    Size: 16,
                    color: widget.controller!.index == 0
                        ? black.withOpacity(0.8)
                        : black.withOpacity(0.5),
                    data: 'Pinned',
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                UnreadMessageInArchive != 0
                    ? Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.controller!.index == 0
                              ? greenmedium
                              : grey,
                        ),
                        child: Center(
                            child: LargeText(
                          Size: 12,
                          color: widget.controller!.index == 0
                              ? white
                              : black.withOpacity(0.4),
                          data: UnreadMessageInArchive.toString(),
                        )),
                      )
                    : Container()
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Tab(
                  child: LargeText(
                    Size: 16,
                    color: widget.controller!.index == 1
                        ? black.withOpacity(0.8)
                        : black.withOpacity(0.5),
                    data: 'Chat',
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                UnreadMessageInChat != 0
                    ? Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.controller!.index == 1
                              ? greenmedium
                              : grey,
                        ),
                        child: Center(
                            child: LargeText(
                          Size: 12,
                          color: widget.controller!.index == 1
                              ? white
                              : black.withOpacity(0.4),
                          data: UnreadMessageInChat.toString(),
                        )),
                      )
                    : Container()
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Tab(
                  child: LargeText(
                    Size: 16,
                    color: widget.controller!.index == 2
                        ? black.withOpacity(0.8)
                        : black.withOpacity(0.5),
                    data: 'Calls',
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                UnreadCall != 0
                    ? Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.controller!.index == 2
                              ? greenmedium
                              : grey,
                        ),
                        child: Center(
                            child: LargeText(
                          Size: 12,
                          color: widget.controller!.index == 2
                              ? white
                              : black.withOpacity(0.4),
                          data: UnreadCall.toString(),
                        )),
                      )
                    : Container()
              ],
            )
          ]),
    );
  }
}
