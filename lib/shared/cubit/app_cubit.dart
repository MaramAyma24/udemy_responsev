import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/bussines/bussines_screen.dart';
import '../../modules/scince/science_screen.dart';
import '../../modules/sports/sports_screen.dart';
import '../network/local/cache_helper.dart';
import '../network/remte/dio_hilpper.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(super.initialState);
  static AppCubit get(context) => BlocProvider.of(context);

  bool appTheme = false;

  void changeAppTheme({bool? appMode}) {
    if (appMode != null) {
      appTheme == appMode;
      emit(AppChangeAppThemeState());
    } else {
      appTheme = !appTheme;
      CacheHelper.putData(key: 'appTheme', value: appTheme).then((value) {
        emit(AppChangeAppThemeState());
      });
    }
  }

  List<Widget> screens = [BusinessScreen(), SportsScreen(), ScienceScreen()];

  int currentIndex = 0;

  List<BottomNavigationBarItem> botItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business_sharp), label: 'business'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports_gymnastics_outlined), label: 'sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'scenes'),
  ];

  void changeBotNavBar(int index) {
    currentIndex = index;
    if (index == 0) {
      getBusiness();
    } else if (index == 1) {
      getSports();
    } else {
      getScience();
    }
    emit(AppBotNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    if (business.isEmpty) {
      emit(NewsGetBusinessLoadingState());
      DioHelper.getData(path: 'v2/top-headlines', query: {
        "country": 'eg',
        "category": 'business',
        "apikey": '65f7f556ec76449fa7dc7c0069f040ca',
      }).then((value) {
        business = value.data['articles'];
        print(business[0]['title'].toString());
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];
  void getSports() {
    if (sports.isEmpty) {
      emit(NewsGetSportsLoadingState());
      DioHelper.getData(path: 'v2/top-headlines', query: {
        "country": 'eg',
        "category": 'sports',
        "apikey": '65f7f556ec76449fa7dc7c0069f040ca'
      }).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title'].toString());
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    if (science.isEmpty) {
      emit(NewsGetScienceLoadingState());
      DioHelper.getData(path: 'v2/top-headlines', query: {
        "country": 'eg',
        "category": 'science',
        "apikey": '65f7f556ec76449fa7dc7c0069f040ca'
      }).then((value) {
        science = value.data['articles'];
        print(science[0]['title'].toString());
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
            path: 'v2/everything',
            query: {"q": value, "apikey": '65f7f556ec76449fa7dc7c0069f040ca'})
        .then((value) {
      science = value.data['articles'];
      print(science[0]['title'].toString());
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
