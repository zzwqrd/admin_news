import 'dart:convert';
import 'dart:io';
import 'dart:developer';

import 'package:admin_pnal/Helper/prefs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// const String BASE_URL = "http://192.168.1.5/avtar_2/public/api";
// const String BASE_URL = "http://localhost/avtar_2/public/api";
const String BASE_URL = "http://192.168.1.5/avtar_2/public/api";

class ServerGate {
  Dio dio = Dio();
  // Logger log = const Logger('--------- Server Gate Logger -------- ');
  void addInterceptors() {
    dio.interceptors.add(CustomApiInterceptor());
  }

  // ------- POST DATA TO SERVER -------//
  Future<CustomResponse> sendToServer({
    @required String? url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    // remove nulls from body
    if (body != null) {
      // ignore: avoid_print
      body.removeWhere(
        (key, value) => body[key] == null || body[key] == "",
      );
      // ignore: avoid_print
    }
    try {
      // log.info("======== body ========");
      // log.info(body);
      // log.info("======== url ========");
      // log.info("$BASE_URL/$url");
      Response response = await dio.post("$BASE_URL/$url",
          data: FormData.fromMap(body!),
          options: Options(
            headers: headers,
          ),
          queryParameters: params);
      return CustomResponse(
        success: true,
        statusCode: 200,
        errType: null,
        error: null,
        msg: "Your request completed succesfully",
        response: response,
      );
    } on DioError catch (err) {
      // print("_((______${err.response}___________VEWWWW");
      return handleServerError(err);
    }
  }

  // ------- PATCH DATA TO SERVER -------//
  Future<CustomResponse> patchToServer({
    @required String? url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    // remove nulls from body
    if (body != null) {
      // print(body.entries.toString() + "________________________");
      body.removeWhere(
        (key, value) => body[key] == null || body[key] == "",
      );
      // print(body.entries.toString() + "________________________");
    }
    try {
      Response response = await dio.patch("$BASE_URL/$url",
          data: FormData.fromMap(body!),
          options: Options(
            headers: headers,
          ),
          queryParameters: params);
      return CustomResponse(
        success: true,
        statusCode: 200,
        errType: null,
        error: null,
        msg: "Your request completed succesfully",
        response: response,
      );
    } on DioError catch (err) {
      print("_________${err}___________VEWWWW");
      return handleServerError(err);
    }
  }

  //-----------Put--------------
  Future<CustomResponse> putToServer({
    @required String? url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    // remove nulls from body
    if (body != null) {
      body.removeWhere(
        (key, value) => body[key] == null || body[key] == "",
      );
    }
    try {
      Response response = await dio.put(
        "$BASE_URL/$url",
        data: FormData.fromMap(body!),
        options: Options(
          headers: headers,
        ),
        queryParameters: params,
      );
      return CustomResponse(
        success: true,
        statusCode: 200,
        errType: null,
        error: null,
        msg: "Your request completed succesfully",
        response: response,
      );
    } on DioError catch (err) {
      print("_________${err}___________VEWWWW");
      return handleServerError(err);
    }
  }

  //-----------Delete--------------
  Future<CustomResponse> deleteFromServer({
    @required String? url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    // remove nulls from body
    if (body != null) {
      body.removeWhere(
        (key, value) => body[key] == null || body[key] == "",
      );
    }
    try {
      Response response = await dio.delete(
        "$BASE_URL/$url",
        // data: FormData.fromMap(body!),
        options: Options(
          headers: headers,
        ),
        queryParameters: params,
      );
      return CustomResponse(
        success: true,
        statusCode: 200,
        errType: null,
        error: null,
        msg: "Your request completed succesfully",
        response: response,
      );
    } on DioError catch (err) {
      print("_________${err}___________VEWWWW");
      return handleServerError(err);
    }
  }

  // ------ GET DATA FROM SERVER -------//
  Future<CustomResponse> getFromServer({
    @required String? url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  }) async {
    try {
      if (params != null) {
        print(params);
        params.removeWhere(
          (key, value) => params[key] == null || params[key] == "",
        );
      }
      Response response = await dio.get(
        "$BASE_URL/$url",
        options: Options(
          headers: headers,
        ),
        queryParameters: params,
      );
      return CustomResponse(
        success: true,
        statusCode: 200,
        errType: null,
        error: null,
        msg: "Your request completed succesfully",
        response: response,
      );
    } on DioError catch (err) {
      return handleServerError(err);
    }
  }

  // ------ Download DATA FROM SERVER -------//
  Future<CustomResponse> downloadFromServer({
    @required String? url,
    @required String? path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  }) async {
    try {
      CancelToken cancelToken = CancelToken();
      Response response = await dio.download(url!, path, cancelToken: cancelToken, onReceiveProgress: (received, total) {
        print((received / total * 100).toStringAsFixed(0) + "%");
      });
      print("response from download =-=-=> ${response.data.toString()}");
      return CustomResponse(
        success: true,
        statusCode: 200,
        errType: null,
        error: null,
        msg: "Your request completed succesfully",
        response: response,
      );
    } on DioError catch (err) {
      return handleServerError(err);
    }
  }

  // -------- HANDLE ERROR ---------//
  CustomResponse handleServerError(DioError err) {
    if (err.type == DioErrorType.response) {
      if (err.response!.data.toString().contains("DOCTYPE") ||
          err.response!.data.toString().contains("<script>") ||
          err.response!.data["exception"] != null) {
        return CustomResponse(
          success: false,
          errType: 2,
          statusCode: err.response!.statusCode ?? 500,
          msg: 'server error',
          response: null,
        );
      }
      if (err.response!.statusCode == 401) {
        Prefs.remove('token');
        Prefs.remove('first_name');
        Prefs.remove('last_name');
        Prefs.remove('email');
        Prefs.remove('image');
        Prefs.remove('type');
        Prefs.remove('isActive');
        Prefs.remove('currentLocale');
        Prefs.remove('complete_data');
        Prefs.remove('cart_count');
        Prefs.remove('confirm_email_code');
        // UserHelper.logout();
        // SnackHelper.infoBar(message: lang.tr(LocaleKeys.Validator_Validate_The_registration_session_ended));
      }
      try {
        return CustomResponse(
          success: false,
          statusCode: err.response?.statusCode ?? 500,
          errType: 1,
          msg: (err.response!.data["errors"] as Map).values.first.first,
          error: null,
          response: err.response,
        );
      } catch (e) {
        return CustomResponse(
          success: false,
          statusCode: err.response?.statusCode ?? 500,
          errType: 1,
          msg: err.response?.data["message"],
          error: null,
          response: err.response,
        );
      }
    } else if (err.type == DioErrorType.receiveTimeout || err.type == DioErrorType.sendTimeout) {
      return CustomResponse(
        success: false,
        statusCode: err.response?.statusCode ?? 500,
        errType: 0,
        msg: 'server error',
        error: null,
        response: null,
      );
    } else {
      if (err.response == null) {
        return CustomResponse(
          success: false,
          statusCode: 402,
          errType: 0,
          msg: 'server error',
          error: null,
          response: null,
        );
      }
      return CustomResponse(
        success: false,
        statusCode: 402,
        errType: 2,
        msg: 'server error',
        error: null,
        response: null,
      );
    }
  }
  // CustomResponse handleServerError(DioError err) {
  //   if (err.response == null) {
  //     print("=-=-=-= ERROR FROM THE SERVER =-=-=-=-=");
  //     // log.error(err.response!.data.toString());
  //     // Get.snackbar("Register Error", err.response.data.toString());
  //     // throw SocketException("");
  //     return CustomResponse(
  //       success: false,
  //       statusCode: 5000,
  //       errType: 0,
  //       msg: "No Intenet",
  //       error: "",
  //       response: null,
  //     );
  //   } else if (err.type == DioErrorType.response) {
  //     print("=-=-=-= ERROR FROM THE SERVER =-=-=-=-=");
  //     // log.error(err.response!.data.toString());
  //     // Get.snackbar("Register Error", err.response.data.toString());
  //     // throw SocketException("");
  //     return CustomResponse(
  //       success: false,
  //       statusCode: err.response!.statusCode,
  //       errType: 1,
  //       msg: err.response!.data["message"] ?? "Please cheack these errors and try again.",
  //       error: err.response!.data,
  //       response: null,
  //     );
  //   } else if (err.type == DioErrorType.other && err.error != null && err.error is SocketException) {
  //     // PLEASE CHECK YOUR NETWORK CONNECTION .
  //     return CustomResponse(
  //       success: false,
  //       // statusCode: err.response.statusCode,
  //       errType: 0,
  //       msg: "Please Check Your network Connection.",
  //       error: null,
  //       response: null,
  //     );
  //   } else if (err.type == DioErrorType.other) {
  //     // print("xcxcxcxcxcxcxcxcxcxcxcxcxcxcx");
  //     // print("print error =>>> ${err.error}");
  //     // print("print error =>>> ${err.message}");
  //     return CustomResponse(
  //       success: false,
  //       statusCode: err.response!.statusCode ?? 500,
  //       errType: 2,
  //       msg: "Server Error, Please try again later.",
  //       error: null,
  //       response: null,
  //     );
  //   } else {
  //     print("FromServerGate=================================???");
  //     return CustomResponse(
  //       success: false,
  //       statusCode: err.response!.statusCode,
  //       errType: 2,
  //       msg: "Server Error, Please try again later.",
  //       error: null,
  //       response: null,
  //     );
  //   }
  // }
}

class CustomApiInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log("--------- Server Gate Logger --------> \x1B[37m------ Current Error Response -----\x1B[0m");
    log("--------- Server Gate Logger --------> \x1B[31m${err.response!.data}\x1B[0m");
    return super.onError(err, handler);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    // CURRENT RESPONSE
    log("--------- Server Gate Logger --------> \x1B[37m------ Current Response -----\x1B[0m");
    log("--------- Server Gate Logger --------> \x1B[32m${jsonEncode(response.data)}\x1B[0m");
    return super.onResponse(response, handler);
  }

  // @required
  //  return Response(
  //     data: {
  //       "message": LocaleKeys.Number_of_hours_Article_optional.tr(),
  //     },
  //     requestOptions: null,
  //     statusCode: 700,
  //   );
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // CURRENT REQUEST
    // FormData formData;
    // formData.fields
    // return Exception("hi error");
    if (options.queryParameters != null) {
      log("--------- Server Gate Logger --------> \x1B[37m------ Current Request Parameters Data -----\x1B[0m");
      log("--------- Server Gate Logger --------> \x1B[33m${options.queryParameters}\x1B[0m");
    }
    log("--------- Server Gate Logger --------> \x1B[37m------ Current Request Headers -----\x1B[0m");
    log("--------- Server Gate Logger --------> \x1B[33m${options.headers}\x1B[0m");
    log("--------- Server Gate Logger --------> \x1B[37m------ Current Request Path -----\x1B[0m");
    log("--------- Server Gate Logger --------> \x1B[36m${options.path} \x1B[31m  API METHOD : (${options.method})\x1B[0m");
    return super.onRequest(options, handler);
  }
}

class CustomResponse {
  bool? success;
  int? errType;
  // 0 => network error
  // 1 => error from the server
  // 2 => other error
  String? msg;
  int? statusCode;
  Response? response;
  // ignore: unnecessary_question_mark
  dynamic? error;
  CustomResponse({
    this.success,
    this.errType,
    this.msg,
    this.statusCode,
    this.response,
    this.error,
  });
}

class CustomError {
  int? type;
  String? msg;
  dynamic error;
  CustomError({
    this.type,
    this.msg,
    this.error,
  });
}

String? apiToken = '';
String? deviceToken = '';
String? status = '';
bool? isActive = false;

String? confirmEmailCode = '';
// String? status = 'fail';
String? firstName = '';
dynamic langKey = '';
