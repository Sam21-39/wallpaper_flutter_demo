import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_flutter_demo4/features/views/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Fixed orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ScreenUtilInit(
      designSize: const Size(480, 960),
      builder: (context, child) {
        return MaterialApp(
          title: 'FlutterForecast',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
            ),
            fontFamily: "NunitoSans",
            useMaterial3: true,
          ),
          home: const Home(),
          builder: EasyLoading.init(
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            ),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
