abstract class SocialStates {}

class SocialInitial extends SocialStates {}

///get users data states
///
class SocialGetUserDataLoadingState extends SocialStates {}
class SocialGetUserDataSuccessState extends SocialStates {}
class SocialGetUserDataErrorState extends SocialStates {
  final String error;
  SocialGetUserDataErrorState(this.error);
}

///get all users states
///
class SocialGetAllUsersLoadingState extends SocialStates {}
class SocialGetAllUsersSuccessState extends SocialStates {}
class SocialGetAllUsersErrorState extends SocialStates {
  final String error;
  SocialGetAllUsersErrorState(this.error);
}

///get posts data states
///
class SocialGetPostDataLoadingState extends SocialStates {}
class SocialGetPostDataSuccessState extends SocialStates {}
class SocialGetPostDataErrorState extends SocialStates {
  final String error;
  SocialGetPostDataErrorState(this.error);
}

///change bottom navigation state
///
class SocialChangeBottomNavState extends SocialStates{}

///open new post screen state
///
class SocialNewPostState extends SocialStates{}

///pick profile image states
class SocialProfileImagePickedSuccessState extends SocialStates{}
class SocialProfileImagePickedErrorState extends SocialStates{}

///pick cover image states
///
class SocialCoverImagePickedSuccessState extends SocialStates{}
class SocialCoverImagePickedErrorState extends SocialStates{}

///pick post image states
///
class SocialPostImagePickedSuccessState extends SocialStates{}
class SocialPostImagePickedErrorState extends SocialStates{}

///remove post image states
///
class SocialRemovePostImageState extends SocialStates{}

///upload profile image states
///
class SocialUploadProfileImageSuccessState extends SocialStates{}
class SocialUploadProfileImageErrorState extends SocialStates{}

///upload cover image states
///
class SocialUploadCoverImageSuccessState extends SocialStates{}
class SocialUploadCoverImageErrorState extends SocialStates{}

///update users data states
///
class SocialUpdateUserDataLoadingState extends SocialStates{}
class SocialUpdateUserDataErrorState extends SocialStates{}

///create post states
///
class SocialCreatePostLoadingState extends SocialStates{}
class SocialCreatePostSuccessState extends SocialStates{}
class SocialCreatePostErrorState extends SocialStates{}


///like post states
///
class SocialLikePostSuccessState extends SocialStates{}
class SocialLikePostErrorState extends SocialStates{
  final String error;
  SocialLikePostErrorState(this.error);
}

///send message states
///
class SocialSendMessageSuccessState extends SocialStates{}
class SocialSendMessageErrorState extends SocialStates{}

///get message states
///
class SocialGetMessageSuccessState extends SocialStates{}
class SocialGetMessageErrorState extends SocialStates{}
