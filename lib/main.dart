import 'package:all_is_here/ui/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline6: TextStyle(
            fontSize: 36.0,
            fontStyle: FontStyle.italic,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Hind',
            color: Colors.white,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: Menu(),
    );
  }
}
