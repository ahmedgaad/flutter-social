import 'package:flutter/material.dart';
class NewPostScreen extends StatelessWidget {
  const NewPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Add Post',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}