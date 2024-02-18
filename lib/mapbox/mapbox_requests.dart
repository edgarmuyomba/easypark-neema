import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import './dio_exceptions.dart';
import "../variables.dart";

String baseUrl = 'https://api.mapbox.com/directions/v5/mapbox';
String accessToken = secret_token;
String navType = 'driving';

Dio _dio = Dio();

Future getDrivingRouteUsingMapbox(LatLng source, LatLng destination) async {
  String url =
      '$baseUrl/$navType/${source.longitude},${source.latitude};${destination.longitude},${destination.latitude}?alternatives=true&continue_straight=true&geometries=geojson&language=en&overview=full&steps=true&access_token=$accessToken';
  try {
    _dio.options.contentType = Headers.jsonContentType;
    final responseData = await _dio.get(url);
    return responseData.data;
  } catch (e) {
    final errorMessage = DioExceptions.fromDioError(e as DioExceptionType).toString();
    debugPrint(errorMessage);
  }
}