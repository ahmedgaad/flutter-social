abstract class SocialStates {}

class SocialInitial extends SocialStates {}

class SocialGetUserDataLoadingState extends SocialStates {}

class SocialGetUserDataSuccessState extends SocialStates {}

class SocialGetUserDataErrorState extends SocialStates {
  final String error;

  SocialGetUserDataErrorState(this.error);
}

class SocialChangeBottomNavState extends SocialStates{}
class SocialNewPostState extends SocialStates{}
