import 'package:flutter/material.dart';
import 'package:flutter_social/models/user_model.dart';
import 'package:flutter_social/modules/chat_details/chat_details_screen.dart';
import 'package:flutter_social/shared/components_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildChatItem extends StatelessWidget {
  const BuildChatItem({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, ChatDetailsScreen(userModel: userModel));
      },
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                userModel.image,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Row(
              children: [
                Text(
                  userModel.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.andika(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
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
          ],
        ),
      ),
    );
  }
}
