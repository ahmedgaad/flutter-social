// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social/layout/cubit/social_state.dart';
import 'package:flutter_social/models/user_model.dart';
import 'package:flutter_social/modules/chats/chats_screen.dart';
import 'package:flutter_social/modules/feeds/feeds_screen.dart';
import 'package:flutter_social/modules/setting/setting_screen.dart';
import 'package:flutter_social/modules/users/users_screen.dart';

import '../../shared/constants_manager.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitial());

  static SocialCubit get(context) => BlocProvider.of(context);

  UserModel? model;

  void getUserData() {
    emit(SocialGetUserDataLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      //print(value.data());

      model = UserModel.fromJson(value.data()!);
      emit(SocialGetUserDataSuccessState());
    }).catchError((error) {
      print("GetUserDataSuccessState: $error");
      emit(SocialGetUserDataErrorState(error.toString()));
    });
  }

  int currentIndex = 0;

  List<Widget> screens = const [
    FeedsScreen(),
    ChatsScreen(),
    UsersScreen(),
    SettingScreen(),
  ];

  List<String> titles = const [
    "Home",
    "Chats",
    "Users",
    "Setting",
  ];

  void changeBottomNav(int index) {
    if (index == 2) {
      emit(SocialNewPostState());
    } else {
      currentIndex = index;
      emit(SocialChangeBottomNavState());
    }
  }
}
