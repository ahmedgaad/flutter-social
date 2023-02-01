import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social/layout/cubit/social_cubit.dart';
import 'package:flutter_social/modules/feeds/feeds_screen.dart';
import 'package:flutter_social/shared/components_manager.dart';
import 'package:flutter_social/shared/styles/icon_broken.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../layout/cubit/social_state.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({super.key});

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.black,),
            title: const Text(
              'Create Post',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            titleSpacing: 5.0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                IconBroken.Arrow_Left_2,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  var now = DateTime.now();
                  if (cubit.postImage == null) {
                    cubit.createPost(
                      dateTime: now.toString(),
                      text: textController.text,
                    );
                  } else {
                    cubit.uploadPostImage(
                      dateTime: now.toString(),
                      text: textController.text,
                    );
                  }
                },
                child: Text(
                  'post'.toUpperCase(),
                  style: const TextStyle(fontSize: 16.0,),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is SocialCreatePostLoadingState)
                  const LinearProgressIndicator(),
                if(state is SocialCreatePostLoadingState)
                  const SizedBox(height: 5.0,),
                Row(
                  children: [
                     CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          "${cubit.userModel?.image}"),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${cubit.userModel?.name}',
                                style: GoogleFonts.andika(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0),
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
                          Text(
                            "Public",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText:
                          'what is on your mind, ${cubit.userModel?.name}',
                      hintStyle: GoogleFonts.andika(),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 15.0,),
                if(cubit.postImage != null)
                  Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: 160.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(cubit.postImage!),
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 20.0,
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {
                            cubit.removePostImage();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0,),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          cubit.getPostImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              IconBroken.Image,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'add photo',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          '# tags',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
