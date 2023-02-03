import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social/layout/cubit/social_cubit.dart';
import 'package:flutter_social/layout/cubit/social_state.dart';
import 'package:flutter_social/modules/chats/widgets/build_chat_item.dart';
import 'package:flutter_social/shared/components_manager.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => BuildChatItem(userModel: SocialCubit.get(context).users[index]),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: SocialCubit.get(context).users.length,
        );
      },
    );
  }
}
