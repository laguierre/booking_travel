import 'package:booking_travel/models/provider/topbutton_provider_model.dart';
import 'package:booking_travel/pages/details_page.dart';
import 'package:booking_travel/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: kBlackGroundColor, // navigation bar color
    statusBarColor: kBlackGroundColor, // status color bar
    statusBarIconBrightness: Brightness.dark, // status bar icon color
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TopButtonModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Booking Travel App',
        theme: ThemeData(
          primaryColor: const Color(0xFF3EBACE),
          scaffoldBackgroundColor: kBlackGroundColor,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color(0xFFD8ECF1)),
        ),
        home: HomePage(),
      ),
    );
  }
}
