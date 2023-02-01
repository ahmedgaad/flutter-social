import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social/shared/styles/icon_broken.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../layout/cubit/social_cubit.dart';
import '../../layout/cubit/social_state.dart';
import 'widgets/build_post_item.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).posts.length > 0 ,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 6.0,
                    margin: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Image(
                          image: NetworkImage(
                            "https://img.freepik.com/free-photo/horizontal-shot-smiling-curly-haired-woman-indicates-free-space-demonstrates-place-your-advertisement-attracts-attention-sale-wears-green-turtleneck-isolated-vibrant-pink-wall_273609-42770.jpg?w=996&t=st=1674909772~exp=1674910372~hmac=1da17fd155ec85ae8903352e0e277d7cf745d18841b29cc61a9844661987f324",
                          ),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Communicate with friends",
                              style: GoogleFonts.comicNeue(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0)),
                        )
                      ],
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => BuildPostItem(
                      postModel: SocialCubit.get(context).posts[index],
                      index: index,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 9.0,
                    ),
                    itemCount: SocialCubit.get(context).posts.length,
                  ),
                  const SizedBox(
                    height: 8.0,
                  )
                ],
              ),
            );
          },
          fallback: (BuildContext context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
