// ignore_for_file: avoid_print
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_social/layout/cubit/social_cubit.dart';
import 'package:flutter_social/layout/social_layout.dart';
import 'package:flutter_social/shared/components_manager.dart';
import 'package:flutter_social/shared/constants_manager.dart';
import 'package:flutter_social/shared/local/cache_helper.dart';
import 'bloc_observer.dart';
import 'modules/login/login_screen.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}
void main() async {
  print("--main");
  WidgetsFlutterBinding.ensureInitialized();
  print('--main: WidgetsFlutterBinding.ensureInitialized');
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  print('-- main: Firebase.initializeApp');

/*  var token = await FirebaseMessaging.instance.getToken();
  print('-- token of device is: $token');*/

  //foreground fcm
  /* FirebaseMessaging.onMessage.listen((event) {
    print('-- on message');
    print(event.data.toString());
    showToast(text: 'on message', state: ToastStates.SUCCESS);
  });*/

  //when click on notification to open the app
  /*  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('-- on message opened');
    print(event.data.toString());
    showToast(text: 'on message opened', state: ToastStates.SUCCESS);
  });*/

  //background fcm
/*  FirebaseMessaging.onBackgroundMessage(
    _firebaseMessagingBackgroundHandler,
  );*/

  await CacheHelper.init();
  Widget? widget;

  uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget = const SocialLayout();
  } else {
    widget = LoginScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.startWidget});
  final Widget? startWidget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialCubit()
        ..getUserData()
        ..getPostsData(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Social",
            home: startWidget,
          );
        },
      ),
    );
  }
}
