// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social/layout/cubit/social_state.dart';
import 'package:flutter_social/models/user_model.dart';
import 'package:flutter_social/modules/chats/chats_screen.dart';
import 'package:flutter_social/modules/feeds/feeds_screen.dart';
import 'package:flutter_social/modules/setting/setting_screen.dart';
import 'package:flutter_social/modules/users/users_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../modules/new_post/new_post_screen.dart';
import '../../shared/constants_manager.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitial());

  static SocialCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void getUserData() {
    emit(SocialGetUserDataLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      //print(value.data());
      userModel = UserModel.fromJson(value.data()!);
      emit(SocialGetUserDataSuccessState());
    })
        .catchError((error) {
      print("GetUserDataSuccessState: $error");
      emit(SocialGetUserDataErrorState(error.toString()));
    });
  }

  int currentIndex = 0;
  List<Widget> screens = const [
    FeedsScreen(),
    ChatsScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingScreen(),
  ];
  List<String> titles = const [
    "Home",
    "Chats",
    "Post",
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

  var picker = ImagePicker();

  File? profileImage;

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      print("No image selected!");
      emit(SocialProfileImagePickedErrorState());
    }
  }

  File? coverImage;

  Future<void> getCoverImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
    } else {
      print("No image selected!");
      emit(SocialCoverImagePickedErrorState());
    }
  }

  //String profileImageUrl = '';
  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUpdateUserDataLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(SocialUploadProfileImageSuccessState());
        print(value);
        //profileImageUrl = value;
        updateUserData(
          name: name,
          phone: phone,
          bio: bio,
          image: value,
        );
      }).catchError((error) {
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadProfileImageErrorState());
    });
  }

  //String coverImageUrl = '';
  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUpdateUserDataLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUploadCoverImageSuccessState());
        print(value);
        //coverImageUrl = value;
        updateUserData(
          name: name,
          phone: phone,
          bio: bio,
          cover: value,
        );
      }).catchError((error) {
        emit(SocialUploadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadCoverImageErrorState());
    });
  }

  void updateUserData({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? image,
  }) {
    UserModel model = UserModel(
      name: name,
      phone: phone,
      image: image ?? userModel?.image,
      // ?? => that's means '== null'
      cover: cover ?? userModel?.cover,
      email: userModel?.email,
      uId: userModel?.uId,
      bio: bio,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel?.uId)
        .update(model.toJson())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(SocialUpdateUserDataErrorState());
    });
  }
}
