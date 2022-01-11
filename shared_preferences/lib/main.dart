import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferencesapp/src/providers/theme_provider.dart';
import 'package:shared_preferencesapp/src/screens/home_screen.dart';
import 'package:shared_preferencesapp/src/screens/screens.dart';

import 'src/share_preferences/preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp( 
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ThemeProvider(isDarkmode: Preferences.isDarkmode )  )
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName    : ( _ ) => const HomeScreen(),
        SettingsScreen.routerName: ( _ ) => const SettingsScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}