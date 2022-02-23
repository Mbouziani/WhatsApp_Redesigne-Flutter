import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatsapp_redesigne/Models/Chat_Model.dart';
import 'package:whatsapp_redesigne/Models/Conversation_Model.dart';
import 'package:whatsapp_redesigne/View/Theme/colors.dart';
import 'package:whatsapp_redesigne/View/Widgets/Chat_AppBar.dart';
import 'package:whatsapp_redesigne/View/Widgets/Reguler_Text.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.isonline})
      : super(key: key);
  final String name;
  final String image;
  final bool isonline;

  ScrollController _controller = ScrollController();

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
        title: ChatAppBar(image: image, name: name, isonline: isonline),
      ),
      body: Column(children: [
        Expanded(
            child: ListView(
          reverse: true,
          shrinkWrap: true,
          children: List.generate(ConversationData.length, (index) {
            final reversedIndex = ConversationData.length - 1 - index;
            return Padding(
              padding: EdgeInsets.fromLTRB(
                ConversationData[reversedIndex]['isCurenteUser'] ? 150.0 : 16.0,
                4,
                ConversationData[reversedIndex]['isCurenteUser'] ? 16.0 : 150.0,
                4,
              ),
              child: Align(
                alignment: ConversationData[reversedIndex]['isCurenteUser']
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: ConversationData[reversedIndex]['isCurenteUser']
                        ? greenmedium
                        : Colors.grey[300],
                    borderRadius: BorderRadius.only(
                        topLeft: ConversationData[reversedIndex]
                                ['isCurenteUser']
                            ? Radius.circular(15)
                            : Radius.circular(0),
                        topRight: ConversationData[reversedIndex]
                                ['isCurenteUser']
                            ? Radius.circular(0)
                            : Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 12, left: 12, right: 12, bottom: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ConversationData[reversedIndex]['Image'] == null
                              ? Container()
                              : Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              ConversationData[reversedIndex]
                                                  ['Image']),
                                          fit: BoxFit.cover)),
                                ),
                          SizedBox(
                            height: 7,
                          ),
                          ConversationData[reversedIndex]['Content'] == null
                              ? Container()
                              : ExpandableText(
                                  ConversationData[reversedIndex]['Content']
                                      .toString()
                                      .trim(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Gilroy',
                                    color: ConversationData[reversedIndex]
                                            ['isCurenteUser']
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                  linkEllipsis: true,
                                  expandText: 'More',
                                  collapseText: 'less',
                                  maxLines: 20,
                                  linkColor: black,
                                ),
                          SizedBox(
                            height: 7,
                          ),
                          Align(
                            alignment: ConversationData[reversedIndex]
                                    ['isCurenteUser']
                                ? Alignment.bottomRight
                                : Alignment.bottomRight,
                            child: RegularText(
                              Size: 14,
                              color: ConversationData[reversedIndex]
                                      ['isCurenteUser']
                                  ? Colors.white
                                  : Colors.black87,
                              data: ConversationData[reversedIndex]
                                      ['TimeOflastmessage']
                                  .toString()
                                  .trim(),
                            ),
                          )
                        ],
                      )),
                ),
              ),
            );
          }),
        )),
        bottomchatBar()
      ]),
    );
  }
}

//
class bottomchatBar extends StatelessWidget {
  const bottomchatBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            color: black.withOpacity(0.2),
            blurRadius: 5.0,
            offset: Offset(0.0, 0.75))
      ], color: white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: Row(
          children: [
            IconButton(
              color: greenmedium,
              onPressed: () {},
              icon: Icon(
                LineIcons.camera,
                size: 25,
                color: black.withOpacity(0.8),
              ),
            ),
            Expanded(
                child: TextFormField(
              decoration: InputDecoration(
                fillColor: white,
                border: InputBorder.none,
              ),
              cursorColor: greenmedium,
            )),
            IconButton(
              color: greenmedium,
              onPressed: () {},
              icon: Icon(
                LineIcons.creativeCommonsShareAlike,
                size: 22,
                color: black,
              ),
            ),
            IconButton(
              color: greenmedium,
              onPressed: () {},
              icon: Icon(
                LineIcons.beamingFaceWithSmilingEyes,
                size: 22,
                color: black,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Icon(
                LineIcons.microphone,
                size: 20,
                color: white,
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(18),
                primary: greenmedium, // <-- Button color
                onPrimary: greenmedium, // <-- Splash color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
