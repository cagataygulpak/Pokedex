import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 732),
        builder: (BuildContext, Widget) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              
              theme: ThemeData.dark()
                  .copyWith(textTheme: GoogleFonts.latoTextTheme()),
              title: 'Material App',
              home: HomePage());
        });
  }
}
