enum HTTPMethod { get, post, delete, put, patch, multiPart, multiPartPut }

extension HTTPMethodString on HTTPMethod {
  String get string {
    switch (this) {
      case HTTPMethod.get:
        return "get";
      case HTTPMethod.post:
        return "post";
      case HTTPMethod.delete:
        return "delete";
      case HTTPMethod.patch:
        return "patch";
      case HTTPMethod.put:
        return "put";
      case HTTPMethod.multiPart:
        return "multiPart";
      case HTTPMethod.multiPartPut:
        return "multiPartPut";
    }
  }
}

abstract class APIRequestRepresentable {
  String get url;
  String get path;
  String get endpoint;
  dynamic get body;
  HTTPMethod get method;
  Map<String, String>? get urlParams;
  Map<String, String>? get headers;
  Future request();
}
