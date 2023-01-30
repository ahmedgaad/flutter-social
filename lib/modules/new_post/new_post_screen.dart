import 'package:flutter/material.dart';
import 'package:flutter_social/shared/styles/icon_broken.dart';
class NewPostScreen extends StatelessWidget {
  const NewPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        // iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Add Post',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        titleSpacing: 5.0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(IconBroken.Arrow_Left_2)),
      ),
    );
  }
}