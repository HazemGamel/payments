
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:payment/app/constants.dart';

class DioHelper{
 static late Dio dio;

 static init(){
   dio=Dio(
     BaseOptions(baseUrl: baseUrl,receiveDataWhenStatusError: true),
   );

 }

 Future<Response> getdata({
  required String url,
   Map<String,dynamic>? query,
})async{
   dio.options.headers={
     "Content-Type":"application/json",
     "Content-Language":"en"
   };
   return await dio.get(url,queryParameters: query);
 }

 Future<Response> postdata({
   required String url,
  required Map<String,dynamic>? data,
   Map<String,dynamic>? query,
 })async{
   dio.options.headers={
     "Content-Type":"application/json",
     "Content-Language":"en"
   };
   return await dio.post(url,data:data,queryParameters: query);
 }

}