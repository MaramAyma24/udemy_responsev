abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppBotNavState extends AppStates {}

class AppChangeAppThemeState extends AppStates {}

class NewsGetBusinessLoadingState extends AppStates {}

class NewsGetBusinessSuccessState extends AppStates {}

class NewsGetBusinessErrorState extends AppStates {
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsLoadingState extends AppStates {}

class NewsGetSportsSuccessState extends AppStates {}

class NewsGetSportsErrorState extends AppStates {
  final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceLoadingState extends AppStates {}

class NewsGetScienceSuccessState extends AppStates {}

class NewsGetScienceErrorState extends AppStates {
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsGetSearchLoadingState extends AppStates {}

class NewsGetSearchSuccessState extends AppStates {}

class NewsGetSearchErrorState extends AppStates {
  final String error;

  NewsGetSearchErrorState(this.error);
}

class NewsChangeAppThemeState extends AppStates {}

class NewsChangeIconThemeState extends AppStates {}