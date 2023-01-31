import 'package:flutter/material.dart';
import 'package:flutter_social/models/message_model.dart';

class BuildMessageItem extends StatelessWidget {
  const BuildMessageItem({
    super.key, required this.messageModel,
  });

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadiusDirectional.only(
            topEnd: Radius.circular(
              10.0,
            ),
            topStart: Radius.circular(10.0),
            bottomEnd: Radius.circular(10.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child:  Text('${messageModel.text}'),
      ),
    );
  }
}
