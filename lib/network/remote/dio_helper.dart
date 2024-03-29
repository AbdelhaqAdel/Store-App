import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
     dio =  Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,

    ));
  }
  static Future<Response?> Getdata(
      {
        required String url,
         Map<String,dynamic>? query,
        String? lang='en',
        String? token,
      }) async {
    dio?.options.headers= {
          'lang':lang,
          'Authorization':token,
          'Content-Type':'application/json',
        };

    return await dio?.get(url, queryParameters:  query);


  }


  static Future<Response?> Postdata(
      {
        required String url,
         Map<String,dynamic>? query,
        required Map<String,dynamic> data,
        String? lang='en',
        String? token,
      }) async {
    dio?.options.headers= {
      'lang':lang,
      'Authorization':token,
      'Content-Type':'application/json',
    };
    return  dio?.post(url, queryParameters:  query,data:data );


  }

  static Future<Response?> Putdata(
      {
        required String url,
        Map<String,dynamic>? query,
        required Map<String,dynamic> data,
        String? lang='en',
        String? token,
      }) async {
    dio?.options.headers= {
      'lang':lang,
      'Authorization':token,
      'Content-Type':'application/json',
    };
    return  dio?.put(url, queryParameters:  query,data:data );


  }
}
