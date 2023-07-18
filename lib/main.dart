import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:manga_easy_downloads/manga_easy_downloads.dart';
// import 'package:manga_easy_about/manga_easy_about.dart';
//import 'package:manga_easy_profile/manga_easy_profile.dart';
// import 'package:manga_easy_recommendations/manga_easy_recommendation_screen.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';
import 'package:persistent_database/persistent_database.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // RecommendationMicroApp().registerDependencies();
  GetIt getIt = GetIt.instance;
  // getIt.registerFactory<ClientRequest>(() => ClientDio());
  // register local database

  // GetIt getIt = GetIt.instance;
  PersistentDatabaseSembast databaseSembast = PersistentDatabaseSembast();
  await databaseSembast.starting();
  getIt.registerLazySingleton(() => databaseSembast);
  getIt.registerSingleton<Preference>(Preference(databaseSembast));

  var status = await Permission.storage.status;
  if (status.isDenied) {
    Permission.storage.request();
    print(2);
  }
  DownloadMicroApp().registerDependencies();

  // ProfileMicroApp().registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeService().changeTheme(4);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeService().returnThemeData().copyWith(useMaterial3: true),
      // initialRoute: '/profile',
      // routes: {
      //   '/profile': (context) => ProfileMicroApp().routers.values.first,
      // },
      // initialRoute: '/about',
      // routes: {
      //   AboutPage.route: (context) => const AboutPage(),
      // },
      // initialRoute: '/recommendation-screen',
      // routes: {
      //   '/recommendation-screen': (context) =>
      //       RecommendationMicroApp().routers.values.first,
      //   '/migrate': (context) => Container()

      // },
      //  initialRoute: '/changelog',
      // routes: {
      //   ChangeLogPage.route: (context) => const ChangeLogPage(),
      // },
      initialRoute: '/downloads',
      routes: {
        '/downloads': (context) => DownloadMicroApp().routers.values.first,
      },
    );
  }
}
