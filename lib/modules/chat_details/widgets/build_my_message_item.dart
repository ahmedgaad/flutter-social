import 'package:flutter/material.dart';
import 'package:flutter_social/models/message_model.dart';

class BuildMyMessageItem extends StatelessWidget {
  const BuildMyMessageItem({
    super.key, required this.messageModel,
  });

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: const BorderRadiusDirectional.only(
            topEnd: Radius.circular(
              10.0,
            ),
            topStart: Radius.circular(10.0),
            bottomStart: Radius.circular(10.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child:  Text('${messageModel.text}'),
      ),
    );
  }
}
