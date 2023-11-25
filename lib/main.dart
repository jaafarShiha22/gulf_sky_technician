import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gulf_sky_technician/features/presentation/cubits/maintenance_orders/maintenance_orders_cubit.dart';
import 'config/routes/app_router.dart';
import 'core/services/services_locator.dart' as di;
import 'features/presentation/blocs/auth/auth_bloc.dart';


@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  onDidReceiveLocalNotification(
    1,
    message.data['title'] ?? 'No title',
    message.data['body'] ?? 'No body',
    message.data,
    message: message,
  );
}

@pragma('vm:entry-point')
Future<void> onDidReceiveLocalNotification(int id, String title, String body, Map<String, dynamic> payload,
    {RemoteMessage? message}) async {
  AndroidNotificationDetails androidPlatformChannelSpecifics =
  const AndroidNotificationDetails('default_channel', 'Default Channel',
      channelDescription: 'This is the default channel',
      importance: Importance.max,
      priority: Priority.high,
      icon: 'launcher_icon',
      ticker: 'ticker');
  NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: const DarwinNotificationDetails(),
  );

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.show(
    1,
    title,
    body,
    platformChannelSpecifics,
    payload: jsonEncode(payload),
  );
}


Future<void> main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FCMServices();
  runApp(const GulfSkyTechnician());
}

class GulfSkyTechnician extends StatelessWidget {
  const GulfSkyTechnician({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AuthBloc>()),
        BlocProvider(create: (context) => di.sl<MaintenanceOrdersCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Gulf Sky Technician',
        builder: EasyLoading.init(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('ar', ''),
        ],
        locale: const Locale('ar'),
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: const MaterialColor(0xFFFF5959, {
            50: Color.fromRGBO(255, 89, 89, .1),
            100: Color.fromRGBO(255, 89, 89, .2),
            200: Color.fromRGBO(255, 89, 89, .3),
            300: Color.fromRGBO(255, 89, 89, .4),
            400: Color.fromRGBO(255, 89, 89, .5),
            500: Color.fromRGBO(255, 89, 89, .6),
            600: Color.fromRGBO(255, 89, 89, .7),
            700: Color.fromRGBO(255, 89, 89, .8),
            800: Color.fromRGBO(255, 89, 89, .9),
            900: Color.fromRGBO(255, 89, 89, 1),
          }),
        ),
      ),
    );
  }
}
