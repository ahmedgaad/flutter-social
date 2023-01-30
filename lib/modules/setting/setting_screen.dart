import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social/layout/cubit/social_state.dart';
import 'package:flutter_social/modules/edit_profile/edit_profile_screen.dart';
import 'package:flutter_social/shared/components_manager.dart';
import 'package:flutter_social/shared/styles/icon_broken.dart';

import '../../layout/cubit/social_cubit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).userModel;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 210,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 160.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "${userModel?.cover}",
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 64.0,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage('${userModel?.image}'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                '${userModel?.name}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 20.0, height: 1.5),
              ),
              Text(
                '${userModel?.bio}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 15.0,
                      height: 1.5,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '235',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              'Posts',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '265',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              'Photos',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '10k',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              'Followers',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '98',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              'Following',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Add Photos',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  OutlinedButton(onPressed: (){
                    navigateTo(context, EditProfileScreen());
                  }, child: const Icon(IconBroken.Edit, size: 20.0,))
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
