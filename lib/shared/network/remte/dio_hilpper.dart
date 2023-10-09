import 'package:dio/dio.dart';

// base url : https://newsapi.org/
//  method url : v2/top-headlines?
//  queries :country=eg&category=business&apikey=65f7f556ec76449fa7dc7c0069f040ca

class DioHelper {

  static late Dio dio;
  // late
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String path,
    required dynamic query,
    // the type of the map
  }) async {
    return await dio.get(path, queryParameters: query);
  }

}
