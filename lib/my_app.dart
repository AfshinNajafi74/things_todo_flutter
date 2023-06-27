import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/route/screen_names.dart';
import 'route/screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale("fa"),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
                  width: 2,
                  color: Color(0xff7646FF)
              ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const  BorderSide(
              width: 2,
              color: Color(0xff7646FF)
            )
          ),
          filled: true,
          fillColor: Colors.white
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xff7646FF),
        ),
        fontFamily: "vazir",
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => const Color(0xff7646FF)),
          )
        ),
        useMaterial3: true
      ),
      getPages: Screens.routes,
      initialRoute: ScreenNames.route,
    );
  }
}

