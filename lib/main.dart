import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MoneyExchangeApp());
}

class MoneyExchangeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'PayFlow Pro',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color(0xFF6C63FF),
            scaffoldBackgroundColor: Color(0xFFF8F9FE),
            textTheme: GoogleFonts.poppinsTextTheme(),
            colorScheme: ColorScheme.light(
              primary: Color(0xFF6C63FF),
              secondary: Color(0xFF00D4FF),
            ),
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}