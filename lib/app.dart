import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:you22fy/components/app_body.dart';
import 'package:you22fy/components/app_footer.dart';
import 'package:you22fy/components/app_header.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        textTheme: GoogleFonts.zenMaruGothicTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppHeader(),
        body: AppBody(),
        bottomNavigationBar: AppFooter(),
      ),
    );
  }
}
