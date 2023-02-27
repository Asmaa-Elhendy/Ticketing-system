import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticketing_system/model/message_model.dart';

import '../../controller/provider/theme_provider.dart';

chat_Me(
    width, MessageModel message, bool me, ThemeProvider provider, bool admin) {
  return Column(
    crossAxisAlignment: me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: me ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width * .7,
            // height: height*.15,
            color: me
                ? provider.blue_me_chat_light
                : provider.blue_customer_chat_light,
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message.message,
                    style: TextStyle(color: provider.primaryColorLight),
                  ),
                )),
              ],
            ),
          )
        ],
      ),
      CircleAvatar(
        backgroundColor: provider.primaryColor,
        child: Icon(
          Icons.account_circle,
          color: provider.primaryColorLight,
        ),
        radius: 15,
      ),
      Text(
        me
            ? admin
                ? 'Manager'
                : 'me '
            : 'customer',
        style: TextStyle(color: provider.primaryColorLight),
      )
    ],
  );
}
