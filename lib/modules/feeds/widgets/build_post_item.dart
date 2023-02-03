import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social/layout/cubit/social_cubit.dart';
import 'package:flutter_social/layout/cubit/social_state.dart';
import 'package:flutter_social/models/post_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/styles/icon_broken.dart';

class BuildPostItem extends StatelessWidget {
  const BuildPostItem({
    super.key,
    required this.postModel,
    required this.index,
  });

  final PostModel postModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialCubit, SocialStates>(
      builder: (context, state) {
        return Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5.0,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage("${SocialCubit.get(context).userModel?.image}"),
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
                                    postModel.name,
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
                              Text(
                                postModel.dateTime,
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 35.0,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_horiz),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Container(
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey[300],
                      ),
                    ),

                    ///text of post
                    ///
                    Text(
                      postModel.text,
                      style: GoogleFonts.poppins(),
                    ),

                    ///tags
                    ///
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        top: 5.0,
                        bottom: 10.0,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 4.0),
                              child: SizedBox(
                                height: 25.0,
                                child: MaterialButton(
                                  onPressed: () {},
                                  minWidth: 1.0,
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                    "#Software",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: Colors.blue, fontSize: 15.0),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 4.0),
                              child: SizedBox(
                                height: 25.0,
                                child: MaterialButton(
                                  onPressed: () {},
                                  minWidth: 1.0,
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                    "#Flutter",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: Colors.blue, fontSize: 15.0),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    ///post image
                    ///
                    if (postModel.postImage != '')
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 5.0,
                        ),
                        child: Container(
                          height: 160.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "${postModel.postImage}",
                                ),
                              ),
                              borderRadius: BorderRadius.circular(4.0)),
                        ),
                      ),

                    ///Like and Comment Buttons
                    ///
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      IconBroken.Heart,
                                      size: 16.0,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      "${SocialCubit.get(context).likes[index]}",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      IconBroken.Chat,
                                      size: 16.0,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      "0 comment",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///Divider
                    ///
                    Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 8.0),
                      child: Container(
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey[300],
                      ),
                    ),

                    ///Write a comment and like button
                    ///
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 18.0,
                                  backgroundImage: NetworkImage(
                                      "${SocialCubit.get(context).userModel?.image}"),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "Write a comment ...",
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            SocialCubit.get(context).likePost(SocialCubit.get(context).postIds[index]);
                          },
                          child: Row(
                            children: [
                              const Icon(
                                IconBroken.Heart,
                                size: 18.0,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Like",
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: 13
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
