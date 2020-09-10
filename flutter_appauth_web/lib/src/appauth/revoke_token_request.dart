@JS("appAuth")
library revoke_token_request;

import "package:js/js.dart";
import "types.dart" show StringMap;
import "package:js/js_util.dart" show promiseToFuture;

/// Supported token types
/*export declare type TokenTypeHint = 'refresh_token' | 'access_token';*/
/// Represents the Token Request as JSON.
@anonymous
@JS()
abstract class RevokeTokenRequestJson {
  external String get token;
  external set token(String v);
  external String /*'refresh_token'|'access_token'*/ get token_type_hint;
  external set token_type_hint(String /*'refresh_token'|'access_token'*/ v);
  external String get client_id;
  external set client_id(String v);
  external String get client_secret;
  external set client_secret(String v);
  external factory RevokeTokenRequestJson(
      {String token,
      String /*'refresh_token'|'access_token'*/ token_type_hint,
      String client_id,
      String client_secret});
}

/// Represents a revoke token request.
/// For more information look at:
/// https://tools.ietf.org/html/rfc7009#section-2.1
@JS()
class RevokeTokenRequest {
  // @Ignore

  external String get token;
  external set token(String v);
  external dynamic /*'refresh_token'|'access_token'|dynamic*/ get tokenTypeHint;
  external set tokenTypeHint(
      dynamic /*'refresh_token'|'access_token'|dynamic*/ v);
  external dynamic /*String|dynamic*/ get clientId;
  external set clientId(dynamic /*String|dynamic*/ v);
  external dynamic /*String|dynamic*/ get clientSecret;
  external set clientSecret(dynamic /*String|dynamic*/ v);
  external factory RevokeTokenRequest(RevokeTokenRequestJson request);

  /// Serializes a TokenRequest to a JavaScript object.
  external RevokeTokenRequestJson toJson();
  external StringMap toStringMap();
}
