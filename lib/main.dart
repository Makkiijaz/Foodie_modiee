import 'package:flutter/material.dart';
import 'package:food_app/favorite_state/favorite_provider.dart';
import 'package:food_app/get_started/get_started_screen.dart';
import 'package:food_app/login_account/login_provider.dart';
import 'package:food_app/theme_changer/theme_changer_provider.dart';
import 'package:flutter/scheduler.dart';
import 'package:food_app/view_model_chNoti/restaurant_chnoti.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider(),),
        ChangeNotifierProvider(create: (context) => ThemeChangerProvider(),),
        ChangeNotifierProvider(create: (context) => LoginProvider(),),
        ChangeNotifierProvider(create: (context) => RestaurantProvider()),
      ],
      child: Builder(
        builder: (context) {
          final  themeChanger = Provider.of<ThemeChangerProvider>(context);
          SchedulerBinding.instance.addPostFrameCallback((_) {
            final Brightness brightness = MediaQuery.of(context).platformBrightness;
            themeChanger.setTheme(brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light);
          });
          return MaterialApp(
            themeMode: themeChanger.themeMode,
            darkTheme: ThemeData(
              primaryTextTheme:const TextTheme(
                headlineLarge: TextStyle(
                  color: Colors.white
                )
              ),
              brightness: Brightness.dark
            ),
            theme: ThemeData(
              brightness: Brightness.light
            ),
            debugShowCheckedModeBanner: false,
            home:  const GetStartedScreen(),
          );
        }
      ),
    );
  }
}
