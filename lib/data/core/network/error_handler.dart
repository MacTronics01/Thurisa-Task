import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../utils/snack_message.dart';


void handleError(dynamic error) {
  var errorString = error.response.toString();
  if (error is DioError) {
    switch (error.type) {
      case DioErrorType.cancel:
        showCustomToast("Request to API server was cancelled");
        break;
      case DioErrorType.connectTimeout:
        showCustomToast("Connection timeout with API server");
        break;
      case DioErrorType.other:
        showCustomToast("Please check your connection");
        break;
      case DioErrorType.receiveTimeout:
        showCustomToast("Receive timeout in connection with API server");
        break;
      case DioErrorType.response:
        final errorMessage =  error.response?.data["message"];
        print("RESPONSE ERROR:::::::::::::::$errorMessage");
        if(errorMessage!=null) {
          showCustomToast(errorMessage);
        }else{
          showCustomToast(error.response?.data)["errors"];
        }
        break;
      case DioErrorType.sendTimeout:
        showCustomToast("Send timeout in connection with API server");
        break;
      default:
        showCustomToast("Something went wrong");
        break;
    }
  } else {
    var json = jsonDecode(errorString);
    var nameJson = json['message'];
    showCustomToast(nameJson);
    throw nameJson;
  }
}