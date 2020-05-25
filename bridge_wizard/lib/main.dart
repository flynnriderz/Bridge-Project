import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/calculating_screen.dart';
import './screens/main_menu_screen.dart';
import './screens/confirm_tables_screen.dart';
import './screens/tables_screen.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bridge Wizard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
              
              button: TextStyle(
                color: Colors.pinkAccent,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => MainMenuScreen(),
        TablesScreen.routeName: (ctx) => TablesScreen(),
        ConfirmTableScreen.routeName: (ctx) => ConfirmTableScreen(),
        CalculatingScreen.routeName: (ctx) => CalculatingScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => MainMenuScreen(),
        );
      },
    );
  }
}
