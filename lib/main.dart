import 'package:client_driver/client_driver.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
//import 'package:manga_easy_about/manga_easy_about.dart';
//import 'package:manga_easy_perfil/manga_easy_profile.dart';
import 'package:manga_easy_recommendations/manga_easy_recommendation_screen.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

void main() {
  RecommendationMicroApp().registerDependencies();
  GetIt getIt = GetIt.instance;
  getIt.registerFactory<ClientRequest>(() => ClientDio());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeService().changeTheme(2);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeService().returnThemeData(),
      // initialRoute: '/profile',
      // routes: {
      //   ProfilePage.route: (context) => const ProfilePage(),
      // },
      // initialRoute: '/about',
      // routes: {
      //   AboutPage.route: (context) => const AboutPage(),
      // },

      initialRoute: '/recommendation-screen',
      routes: {
        '/recommendation-screen': (context) =>
            RecommendationMicroApp().routers.values.first,
        '/migrate': (context) => Container()
      },
    );
  }
}
