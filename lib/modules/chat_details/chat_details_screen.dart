import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social/layout/cubit/social_cubit.dart';
import 'package:flutter_social/layout/cubit/social_state.dart';
import 'package:flutter_social/models/user_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/styles/icon_broken.dart';

class ChatDetailsScreen extends StatelessWidget {
  ChatDetailsScreen({super.key, required this.userModel});

  final UserModel userModel;
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                IconBroken.Arrow_Left_2,
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            titleSpacing: 0.0,
            title: Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage('${userModel.image}'),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Text(
                  '${userModel.name}',
                  style: GoogleFonts.andika(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      color: Colors.black),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                const Icon(
                  Icons.verified_sharp,
                  color: Colors.blue,
                  size: 18.0,
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Align(
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: const Text('Hello World!'),
                  ),
                ),
                Align(
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: const Text('still I love u :('),
                  ),
                ),
                const Spacer(),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: textController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'type your message here ...',
                              contentPadding: EdgeInsets.all(10.0)),
                        ),
                      ),
                      Container(
                        height: 50.0,
                        color: Colors.blue,
                        child: MaterialButton(
                          onPressed: () {
                            SocialCubit.get(context).sendMessage(
                              recieverId: userModel.uId!,
                              dateTime: DateTime.now().toString(),
                              text: textController.text,
                            );
                          },
                          minWidth: 1.0,
                          child: const Icon(
                            IconBroken.Send,
                            size: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
