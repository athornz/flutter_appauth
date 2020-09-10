@JS("appAuth")
library authorization_response;

import "package:js/js.dart";
import "package:js/js_util.dart" show promiseToFuture;

/// Represents the AuthorizationResponse as a JSON object.
@anonymous
@JS()
abstract class AuthorizationResponseJson {
  external String get code;
  external set code(String v);
  external String get state;
  external set state(String v);
  external factory AuthorizationResponseJson({String code, String state});
}

/// Represents the AuthorizationError as a JSON object.
@anonymous
@JS()
abstract class AuthorizationErrorJson {
  external String get error;
  external set error(String v);
  external String get error_description;
  external set error_description(String v);
  external String get error_uri;
  external set error_uri(String v);
  external String get state;
  external set state(String v);
  external factory AuthorizationErrorJson(
      {String error, String error_description, String error_uri, String state});
}

/// Represents the Authorization Response type.
/// For more information look at
/// https://tools.ietf.org/html/rfc6749#section-4.1.2
@JS()
class AuthorizationResponse {
  // @Ignore

  external String get code;
  external set code(String v);
  external String get state;
  external set state(String v);
  external factory AuthorizationResponse(AuthorizationResponseJson response);
  external AuthorizationResponseJson toJson();
}

/// Represents the Authorization error response.
/// For more information look at:
/// https://tools.ietf.org/html/rfc6749#section-4.1.2.1
@JS()
class AuthorizationError {
  // @Ignore

  external String get error;
  external set error(String v);
  external String get errorDescription;
  external set errorDescription(String v);
  external String get errorUri;
  external set errorUri(String v);
  external String get state;
  external set state(String v);
  external factory AuthorizationError(AuthorizationErrorJson error);
  external AuthorizationErrorJson toJson();
}

@JS()
abstract class Promise<T> {
  external factory Promise(
      void executor(void resolve(T result), Function reject));
  external Promise then(void onFulfilled(T result), [Function onRejected]);
}
