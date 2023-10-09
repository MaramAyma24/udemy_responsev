import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/shared/cubit/app_cubit.dart';
import 'package:news/shared/cubit/app_states.dart';
import 'package:news/shared/network/local/cache_helper.dart';
import 'package:news/shared/network/remte/dio_hilpper.dart';
import 'package:news/shared/observer.dart';
import 'layout/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // when the main is taken async

  Bloc.observer = MyBlocObserver();

  DioHelper.init();

  await CacheHelper.init();

  bool? appTheme = CacheHelper.getData(key: 'appTheme');

  runApp(MyApp(appTheme!));
}

class MyApp extends StatelessWidget {
  final bool appTheme;
  MyApp(this.appTheme);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(AppInitialState())
      //    ..changeAppTheme()
      //  ..getBusiness()
      //  ..getScience()
      //  ..getSports()
      ,
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
        //      brightness: Brightness.light,
              primarySwatch: Colors.brown,
              textTheme: TextTheme(
                  bodySmall: TextStyle(
                      color: HexColor('333937'),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600)),
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                titleTextStyle: TextStyle(
                    color: HexColor('333739'),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                iconTheme: IconThemeData(color: HexColor('333739')),
                //backgroundColor: Colors.transparent,
                // wwoooooooowwwww

                //  systemOverlayStyle: SystemUiOverlayStyle(
                //   statusBarColor: Colors.white,
                //  statusBarBrightness: Brightness.dark,
                // ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.brown,
                elevation: 10.0,
              ),
              scaffoldBackgroundColor: Colors.white,
            ),
            //  ......
            darkTheme: ThemeData(
           //   brightness: Brightness.dark,
              primarySwatch: Colors.brown,
              textTheme: TextTheme(
                  bodyMedium: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600)),
              appBarTheme: AppBarTheme(
                backgroundColor: HexColor('333739'),
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                iconTheme: IconThemeData(color: Colors.white),
                //backgroundColor: Colors.transparent,
                // wwoooooooowwwww

                //  systemOverlayStyle: SystemUiOverlayStyle(
                //   statusBarColor: Colors.white,
                //  statusBarBrightness: Brightness.dark,
                // ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('333937'),
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.brown[400],
                unselectedItemColor: Colors.grey,
                elevation: 10.0,
              ),
              scaffoldBackgroundColor: HexColor('333937'),
            ),
            themeMode: AppCubit.get(context).appTheme
                ? ThemeMode.light
                : ThemeMode.dark,
            home: NewsLayout(),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}

// colorScheme: ColorScheme(
//           background: Colors.black,
//           brightness: Brightness.dark,
//           primary: Colors.brown,
//           onPrimary: Colors.purple,
//           secondary: Colors.brown,
//           onSecondary: Colors.grey,
//           error: Colors.red,
//           onError: Colors.green,
//           onBackground: Colors.orange,
//           surface: Colors.brown,
//           onSurface: Colors.white,),

//
//textTheme:  TextTheme(
//bodyLarge: TextStyle(
//color: Colors.white,
//fontSize: 18.0,
//fontWeight: FontWeight.w600)),
//primarySwatch: Colors.brown,
//appBarTheme: AppBarTheme(
//backgroundColor: HexColor('333739'),
//titleTextStyle: TextStyle(
//color: Colors.white,
//fontSize: 20,
//fontWeight: FontWeight.bold),
//iconTheme: IconThemeData(color: Colors.white),
//backgroundColor: Colors.transparent,
// wwoooooooowwwww

//  systemOverlayStyle: SystemUiOverlayStyle(
//   statusBarColor: Colors.white,
//  statusBarBrightness: Brightness.dark,
// ),
//),
//bottomNavigationBarTheme: BottomNavigationBarThemeData(
//backgroundColor: HexColor('333739'),
//type: BottomNavigationBarType.fixed,
//selectedItemColor: Colors.brown,
//unselectedItemColor: Colors.grey,
//elevation: 10.0,
//),
//scaffoldBackgroundColor: HexColor('333739'),
