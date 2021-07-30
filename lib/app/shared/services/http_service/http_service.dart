import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import '../interceptors/info_interceptors.dart';

class HttpService extends DioForNative implements IHttpService {
  @override
  HttpClientAdapter httpClientAdapter = DefaultHttpClientAdapter();

  HttpService() {
    options.headers.addAll({HttpHeaders.contentTypeHeader: 'application/json'});
    options.setRequestContentTypeWhenNoPayload = true;

    setUpInterceptors();
  }

  @override
  void setEnviroment() {
    options.baseUrl = '?api_key=8s4pckVwHlab7pUcZrybU06dnwBfzjcacajSwRVp';
  }

  @override
  void setUpInterceptors() {
    interceptors.add(InfoInterceptors());
  }
}

abstract class IHttpService extends DioForNative {
  void setUpInterceptors();
  void setEnviroment();
}
