import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social/layout/cubit/social_cubit.dart';
import 'package:flutter_social/layout/cubit/social_state.dart';
import 'package:flutter_social/modules/new_post/new_post_screen.dart';
import 'package:flutter_social/shared/components_manager.dart';
import 'package:flutter_social/shared/styles/icon_broken.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if (state is SocialNewPostState) {
          navigateTo(context,  NewPostScreen());
        }
      },
      builder: (context, state) {
        SocialCubit cubit = SocialCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text(
              cubit.titles[cubit.currentIndex],
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconBroken.Notification,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconBroken.Search,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              backgroundColor: Colors.white,
              elevation: 20.0,
              iconSize: 28.0,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Home,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Chat,
                  ),
                  label: "Chats",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Paper_Upload,
                  ),
                  label: "Post",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Location,
                  ),
                  label: "Users",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Setting,
                  ),
                  label: "Setting",
                ),
              ]),
        );
      },
    );
  }
}


























//  ConditionalBuilder(
          //   condition: SocialCubit.get(context).model != null,
          //   builder: (BuildContext context) {
          //     // var model = SocialCubit.get(context).model;
          //     return Column(
          //       children: [              
          //         // if (!FirebaseAuth.instance.currentUser!.emailVerified)
          //         //   Container(
          //         //     color: Colors.amber.withOpacity(0.6),
          //         //     height: 60.0,
          //         //     child: Padding(
          //         //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //         //       child: Row(
          //         //         children: [
          //         //           const Icon(
          //         //             Icons.info_outline_rounded,
          //         //             size: 20.0,
          //         //           ),
          //         //           const SizedBox(
          //         //             width: 10.0,
          //         //           ),
          //         //           const Expanded(
          //         //             child: Text(
          //         //               "Please Verify your email",
          //         //               style: TextStyle(
          //         //                 fontWeight: FontWeight.bold,
          //         //               ),
          //         //             ),
          //         //           ),
          //         //           const SizedBox(
          //         //             width: 35.0,
          //         //           ),
          //         //           TextButton(
          //         //               onPressed: () {
          //         //                 FirebaseAuth.instance.currentUser
          //         //                     ?.sendEmailVerification()
          //         //                     .then((value) {
          //         //                   showToast(
          //         //                       text: "Check your mail",
          //         //                       state: ToastStates.SUCCESS);
          //         //                 });
          //         //               },
          //         //               child: const Text(
          //         //                 "SEND",
          //         //               )),
          //         //         ],
          //         //       ),
          //         //     ),
          //         //   )
          //       ],
          //     );
          //   },
          //   fallback: (BuildContext context) =>
          //       const Center(child: CircularProgressIndicator()),
          // ),