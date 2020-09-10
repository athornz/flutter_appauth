@JS("appAuth")
library token_request_handler;

import "package:js/js.dart";
import "package:js/js_util.dart" show promiseToFuture;

import "authorization_service_configuration.dart"
    show AuthorizationServiceConfiguration;
import 'crypto_utils.dart';
import "query_string_utils.dart" show QueryStringUtils;
import "revoke_token_request.dart" show RevokeTokenRequest;
import "token_request.dart" show TokenRequest;
import "token_response.dart" show TokenResponse;
import "xhr.dart" show Requestor;

/// Represents an interface which can make a token request.
@anonymous
@JS()
abstract class TokenRequestHandler {}

@anonymous
@JS()
abstract class _TokenRequestHandler {
  /// Performs the token request, given the service configuration.
  external Promise<TokenResponse> performTokenRequest(
      AuthorizationServiceConfiguration configuration, TokenRequest request);

  external Promise<bool> performRevokeTokenRequest(
      AuthorizationServiceConfiguration configuration,
      RevokeTokenRequest request);
}

extension TokenRequestHandlerExtensions on TokenRequestHandler {
  Future<TokenResponse> performTokenRequest(
      AuthorizationServiceConfiguration configuration, TokenRequest request) {
    final Object t = this;
    final _TokenRequestHandler tt = t;
    return promiseToFuture(tt.performTokenRequest(configuration, request));
  }

  Future<bool> performRevokeTokenRequest(
      AuthorizationServiceConfiguration configuration,
      RevokeTokenRequest request) {
    final Object t = this;
    final _TokenRequestHandler tt = t;
    return promiseToFuture(
        tt.performRevokeTokenRequest(configuration, request));
  }
}

/// The default token request handler.
@JS()
class BaseTokenRequestHandler implements TokenRequestHandler {
  // @Ignore


  external Requestor get requestor;

  external QueryStringUtils get utils;

  external factory BaseTokenRequestHandler(
      [Requestor requestor, QueryStringUtils utils]);

  external get isTokenResponse;

  external set isTokenResponse(v);
}

@JS("BaseTokenRequestHandler")
abstract class _BaseTokenRequestHandler {
  external Promise<bool> performRevokeTokenRequest(
      AuthorizationServiceConfiguration configuration,
      RevokeTokenRequest request);

  external Promise<TokenResponse> performTokenRequest(
      AuthorizationServiceConfiguration configuration, TokenRequest request);
}

extension BaseTokenRequestHandlerExtensions on BaseTokenRequestHandler {
  Future<bool> performRevokeTokenRequest(
      AuthorizationServiceConfiguration configuration,
      RevokeTokenRequest request) {
    final Object t = this;
    final _BaseTokenRequestHandler tt = t;
    return promiseToFuture(
        tt.performRevokeTokenRequest(configuration, request));
  }

  Future<TokenResponse> performTokenRequest(
      AuthorizationServiceConfiguration configuration, TokenRequest request) {
    final Object t = this;
    final _BaseTokenRequestHandler tt = t;
    return promiseToFuture(tt.performTokenRequest(configuration, request));
  }
}
