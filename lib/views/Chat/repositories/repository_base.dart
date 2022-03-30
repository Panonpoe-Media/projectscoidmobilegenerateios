import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import '../models/configuration_model.dart';

BaseOptions options = BaseOptions(
    baseUrl: ConfigurationModel().urlApi!,
    connectTimeout: 5000,
    receiveTimeout: 30000);
var http = Dio(options);

Function certificate = () =>
    (http.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
