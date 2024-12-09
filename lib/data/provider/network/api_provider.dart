import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:grow_up_admin_panel/data/provider/network/api_request_representable.dart';
import 'package:http/http.dart' as http;

class APIProvider {
  static const requestTimeOut = Duration(seconds: 25);
  final _client = http.Client();
  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;

  Future request(APIRequestRepresentable request) async {
    try {
      Uri uri = Uri.https(request.endpoint, request.path, request.urlParams);
      http.Response response;
      switch (request.method) {
        case HTTPMethod.get:
          response = await _client.get(uri, headers: request.headers);
          break;
        case HTTPMethod.post:
          response = await _client.post(uri,
              headers: request.headers, body: request.body);
          break;
        case HTTPMethod.delete:
          response = await _client.delete(uri, headers: request.headers);
          break;
        case HTTPMethod.put:
          response = await _client.put(uri,
              headers: request.headers, body: request.body);
          break;
        case HTTPMethod.patch:
          response = await _client.patch(uri,
              headers: request.headers, body: request.body);
          break;
        case HTTPMethod.multiPart:
          var req = http.MultipartRequest('Post', uri);
          req.fields.addAll(
            request.body['data'],
          );
          req.headers.addAll(request.headers!);
          final res = await req.send();
          response =
              http.Response(await res.stream.bytesToString(), res.statusCode);
          break;
        case HTTPMethod.multiPartPut:
          var req = http.MultipartRequest('Put', uri);
          req.fields.addAll(
            request.body['data'],
          );
          req.headers.addAll(request.headers!);

          if (request.body['PictureDataFile'] != null) {
            final File file = request.body['PictureDataFile'];
            req.files.add(http.MultipartFile.fromBytes(
                "PictureDataFile", file.readAsBytesSync().toList(),
                filename: file.path.split('/').last));
          }
          final res = await req.send();
          response =
              http.Response(await res.stream.bytesToString(), res.statusCode);
          print(response.body);
          break;
      }
return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeoutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final dynamic code, message, details;

  AppException({this.code, this.message, this.details});

  @override
  String toString() {
    try {
      final msg = jsonDecode(message);
      return msg['message'];
    } catch (e) {
      return "$message";
    }
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
      : super(
          code: "fetch-data",
          message: "$details",
          details: details,
        );
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
      : super(
          code: "invalid-request",
          message: details,
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details)
      : super(
          code: "unauthorised",
          message: "Unauthorised",
          details: details,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details)
      : super(
          code: "invalid-input",
          message: "Invalid Input",
          details: details,
        );
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details)
      : super(
          code: "authentication-failed",
          message: "Authentication Failed",
          details: details,
        );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: "request-timeout",
          message: "Request TimeOut",
          details: details,
        );
}
