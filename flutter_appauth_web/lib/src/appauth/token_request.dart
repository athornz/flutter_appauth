@JS("appAuth")
library token_request;

import "package:js/js.dart";
import "types.dart" show StringMap;
import "package:js/js_util.dart" show promiseToFuture;

@JS()
external get GRANT_TYPE_AUTHORIZATION_CODE;
@JS()
external get GRANT_TYPE_REFRESH_TOKEN;

/// Represents the Token Request as JSON.
@anonymous
@JS()
abstract class TokenRequestJson {
  external String get grant_type;
  external set grant_type(String v);
  external String get code;
  external set code(String v);
  external String get refresh_token;
  external set refresh_token(String v);
  external String get redirect_uri;
  external set redirect_uri(String v);
  external String get client_id;
  external set client_id(String v);
  external StringMap get extras;
  external set extras(StringMap v);
  external factory TokenRequestJson(
      {String grant_type,
      String code,
      String refresh_token,
      String redirect_uri,
      String client_id,
      StringMap extras});
}

/// Represents an Access Token request.
/// For more information look at:
/// https://tools.ietf.org/html/rfc6749#section-4.1.3
@JS()
class TokenRequest {
  // @Ignore

  external String get clientId;
  external set clientId(String v);
  external String get redirectUri;
  external set redirectUri(String v);
  external String get grantType;
  external set grantType(String v);
  external dynamic /*String|dynamic*/ get code;
  external set code(dynamic /*String|dynamic*/ v);
  external dynamic /*String|dynamic*/ get refreshToken;
  external set refreshToken(dynamic /*String|dynamic*/ v);
  external dynamic /*StringMap|dynamic*/ get extras;
  external set extras(dynamic /*StringMap|dynamic*/ v);
  external factory TokenRequest(TokenRequestJson request);

  /// Serializes a TokenRequest to a JavaScript object.
  external TokenRequestJson toJson();
  external StringMap toStringMap();
}
