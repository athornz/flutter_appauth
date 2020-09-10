@JS("appAuth")
library authorization_request;

import "package:js/js.dart";
import "crypto_utils.dart" show Crypto;
import "package:js/js_util.dart" show promiseToFuture;

/// Represents an AuthorizationRequest as JSON.
@anonymous
@JS()
abstract class AuthorizationRequestJson {
  external String get response_type;
  external set response_type(String v);
  external String get client_id;
  external set client_id(String v);
  external String get redirect_uri;
  external set redirect_uri(String v);
  external String get scope;
  external set scope(String v);
  external String get state;
  external set state(String v);
  external Object get extras;
  external set extras(Object v);
  external Object get internal;
  external set internal(Object v);
  external factory AuthorizationRequestJson(
      {String response_type,
      String client_id,
      String redirect_uri,
      String scope,
      String state,
      Object extras,
      Object internal});
}

/// Represents the AuthorizationRequest.
/// For more information look at
/// https://tools.ietf.org/html/rfc6749#section-4.1.1
@JS()
class AuthorizationRequest {
  // @Ignore

  external get crypto;
  external set crypto(v);
  external get usePkce;
  external set usePkce(v);
  external static String get RESPONSE_TYPE_TOKEN;
  external static set RESPONSE_TYPE_TOKEN(String v);
  external static String get RESPONSE_TYPE_CODE;
  external static set RESPONSE_TYPE_CODE(String v);
  external String get clientId;
  external set clientId(String v);
  external String get redirectUri;
  external set redirectUri(String v);
  external String get scope;
  external set scope(String v);
  external String get responseType;
  external set responseType(String v);
  external String get state;
  external set state(String v);
  external Object get extras;
  external set extras(Object v);
  external Object get internal;
  external set internal(Object v);

  /// Constructs a new AuthorizationRequest.
  /// Use a `undefined` value for the `state` parameter, to generate a random
  /// state for CSRF protection.
  external factory AuthorizationRequest(AuthorizationRequestJson request,
      [Crypto crypto, bool usePkce]);
}

@JS("AuthorizationRequest")
abstract class _AuthorizationRequest {
  external Promise<void> setupCodeVerifier();

  /// Serializes the AuthorizationRequest to a JavaScript Object.
  external Promise<AuthorizationRequestJson> toJson();
}

extension AuthorizationRequestExtensions on AuthorizationRequest {
  Future<void> setupCodeVerifier() {
    final Object t = this;
    final _AuthorizationRequest tt = t;
    return promiseToFuture(tt.setupCodeVerifier());
  }

  Future<AuthorizationRequestJson> toJson() {
    final Object t = this;
    final _AuthorizationRequest tt = t;
    return promiseToFuture(tt.toJson());
  }
}

@JS()
abstract class Promise<T> {
  external factory Promise(
      void executor(void resolve(T result), Function reject));
  external Promise then(void onFulfilled(T result), [Function onRejected]);
}
