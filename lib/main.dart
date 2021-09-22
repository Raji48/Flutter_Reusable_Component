
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:wait4me/models/app_state.dart';
import 'package:wait4me/reducers/app_reducer.dart';
import 'package:wait4me/routes/route_generator.dart';
import 'package:wait4me/services/ApiMiddleware.dart';



final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  _MyAppState createState()=>_MyAppState();
}

class _MyAppState extends State<MyApp> {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [thunkMiddleware, apiMiddleware, ],
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return StoreProvider(
        store: this.store,
        child: MaterialApp(
          // builder: (context, child) {
          //   return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child:child);
          //   },
          navigatorKey: navigatorKey,
          initialRoute: '/register',
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
          //  home: Splash(),
        )
    );
  }
}

