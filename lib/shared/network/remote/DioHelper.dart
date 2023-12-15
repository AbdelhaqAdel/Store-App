import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper{
 static late Dio dio; 
  static init(){ //initialization for dio object
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        // headers: {
        //   'Content-Type':'application/json',
        //   'lang':'en',
        // }
      ),
      
    ) ;
  }
  
 static Future<Response> GetData({
   required var url,
   Map <String,dynamic>? query,
   String lang ='en',
   String? token,
  })async{
   dio.options.headers={
     'lang':lang,
   'authorizatio':token??'',
     'Content-Type':'application/json',
   };
    return await dio.get(url ,
      queryParameters: query??null,);
  }
 static Future<Response> PostData({
   required var url,
   Map <String,dynamic>? query,
   required Map <String,dynamic> data,
   String lang ='en',
   String? token,
 })async
 {
   dio.options.headers={
     'lang':lang,
     'authorizatio':token??'',
     'Content-Type':'application/json',
   };
   return dio.post(
     url,
     queryParameters: query??null,
     data: data,
   );
 }
}


class DioHelper2{
  static late Dio dio;
  static init(){ //initialization for dio object
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://newsapi.org/',
          receiveDataWhenStatusError: true,
      ),

    ) ;
  }

  static Future<Response> GetData({
    required var url,
    required Map <String,dynamic>? query,
  })async{
    return await dio.get(url , queryParameters: query,);
  }
}
