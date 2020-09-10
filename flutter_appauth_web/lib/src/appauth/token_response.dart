@JS("appAuth")
library token_response;

import "package:js/js.dart";
import "package:js/js_util.dart" show promiseToFuture;

/// Represents the access token types.
/// For more information see:
/// https://tools.ietf.org/html/rfc6749#section-7.1
/*export declare type TokenType = 'bearer' | 'mac';*/
/// Represents the TokenResponse as a JSON Object.
@anonymous
@JS()
abstract class TokenResponseJson {
  external String get access_token;
  external set access_token(String v);
  external String /*'bearer'|'mac'*/ get token_type;
  external set token_type(String /*'bearer'|'mac'*/ v);
  external String get expires_in;
  external set expires_in(String v);
  external String get refresh_token;
  external set refresh_token(String v);
  external String get scope;
  external set scope(String v);
  external String get id_token;
  external set id_token(String v);
  external num get issued_at;
  external set issued_at(num v);
  external factory TokenResponseJson(
      {String access_token,
      String /*'bearer'|'mac'*/ token_type,
      String expires_in,
      String refresh_token,
      String scope,
      String id_token,
      num issued_at});
}

/// Represents the possible error codes from the token endpoint.
/// For more information look at:
/// https://tools.ietf.org/html/rfc6749#section-5.2
/*export declare type ErrorType = 'invalid_request' | 'invalid_client' | 'invalid_grant' | 'unauthorized_client' | 'unsupported_grant_type' | 'invalid_scope';*/
/// Represents the TokenError as a JSON Object.
@anonymous
@JS()
abstract class TokenErrorJson {
  external String /*'invalid_request'|'invalid_client'|'invalid_grant'|'unauthorized_client'|'unsupported_grant_type'|'invalid_scope'*/ get error;
  external set error(
      String /*'invalid_request'|'invalid_client'|'invalid_grant'|'unauthorized_client'|'unsupported_grant_type'|'invalid_scope'*/ v);
  external String get error_description;
  external set error_description(String v);
  external String get error_uri;
  external set error_uri(String v);
  external factory TokenErrorJson(
      {String /*'invalid_request'|'invalid_client'|'invalid_grant'|'unauthorized_client'|'unsupported_grant_type'|'invalid_scope'*/ error,
      String error_description,
      String error_uri});
}

/// Returns the instant of time in seconds.
@JS()
external num Function() get nowInSeconds;

/// Represents the Token Response type.
/// For more information look at:
/// https://tools.ietf.org/html/rfc6749#section-5.1
@JS()
class TokenResponse {
  // @Ignore

  external String get accessToken;
  external set accessToken(String v);
  external String /*'bearer'|'mac'*/ get tokenType;
  external set tokenType(String /*'bearer'|'mac'*/ v);
  external dynamic /*num|dynamic*/ get expiresIn;
  external set expiresIn(dynamic /*num|dynamic*/ v);
  external dynamic /*String|dynamic*/ get refreshToken;
  external set refreshToken(dynamic /*String|dynamic*/ v);
  external dynamic /*String|dynamic*/ get scope;
  external set scope(dynamic /*String|dynamic*/ v);
  external dynamic /*String|dynamic*/ get idToken;
  external set idToken(dynamic /*String|dynamic*/ v);
  external num get issuedAt;
  external set issuedAt(num v);
  external factory TokenResponse(TokenResponseJson response);
  external TokenResponseJson toJson();
  external bool isValid([num buffer]);
}

/// Represents the Token Error type.
/// For more information look at:
/// https://tools.ietf.org/html/rfc6749#section-5.2
@JS()
class TokenError {
  // @Ignore

  external String /*'invalid_request'|'invalid_client'|'invalid_grant'|'unauthorized_client'|'unsupported_grant_type'|'invalid_scope'*/ get error;
  external set error(
      String /*'invalid_request'|'invalid_client'|'invalid_grant'|'unauthorized_client'|'unsupported_grant_type'|'invalid_scope'*/ v);
  external dynamic /*String|dynamic*/ get errorDescription;
  external set errorDescription(dynamic /*String|dynamic*/ v);
  external dynamic /*String|dynamic*/ get errorUri;
  external set errorUri(dynamic /*String|dynamic*/ v);
  external factory TokenError(TokenErrorJson tokenError);
  external TokenErrorJson toJson();
}
