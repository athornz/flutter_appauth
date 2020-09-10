import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_appauth_platform_interface/flutter_appauth_platform_interface.dart'
as platform;
import 'package:flutter_appauth_web/src/appauth/authorization_request.dart';
import 'package:flutter_appauth_web/src/appauth/authorization_request_handler.dart';
import 'package:flutter_appauth_web/src/appauth/authorization_service_configuration.dart';
import 'package:flutter_appauth_web/src/appauth/redirect_based_handler.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:js/js.dart';

class FlutterAppAuthPlugin extends platform.FlutterAppAuthPlatform {

  static void registerWith(Registrar registrar) {
    platform.FlutterAppAuthPlatform.instance = FlutterAppAuthPlugin();
    debugPrint("registering");
  }

  /// Convenience method for authorizing and then exchanges the authorization grant code.
  Future<platform.AuthorizationTokenResponse> authorizeAndExchangeCode(
      platform.AuthorizationTokenRequest request) {
    debugPrint("web authorizeAndExchangeCode2");

    try {
      var notifier = new AuthorizationNotifier();
      var authorizationHandler = new RedirectRequestHandler();
      authorizationHandler.setAuthorizationNotifier(notifier);
      notifier
          .setAuthorizationListener(allowInterop((request, response, error) {
        debugPrint('Authorization request complete ');
        // debugPrint('Authorization request complete ', request, response, error);
        // if (response) {
        // this.code = response.code;
        // this.showMessage(`Authorization Code ${response.code}`);
        // }
      }));

// create a request
    var authRequest = AuthorizationRequest(AuthorizationRequestJson(client_id:request.clientId,
    response_type: AuthorizationRequest.RESPONSE_TYPE_CODE,
    extras: {'prompt': 'consent', 'access_type': 'offline'},
    redirect_uri: request.redirectUrl,
    scope: request.scopes.join(" "),
    ));

    var config = AuthorizationServiceConfiguration(AuthorizationServiceConfigurationJson(
    authorization_endpoint: request.serviceConfiguration?.authorizationEndpoint,
    token_endpoint: request.serviceConfiguration?.tokenEndpoint,
    ));

// make the authorization request
    authorizationHandler.performAuthorizationRequest(config, authRequest);
    } catch (e) {
    print(e);
    }
  }

  /// Sends an authorization request.
  Future<platform.AuthorizationResponse> authorize(
      platform.AuthorizationRequest request) {
    debugPrint("web authorize");
    throw UnimplementedError('authorize() has not been implemented');
  }

  /// For exchanging tokens.
  Future<platform.TokenResponse> token(platform.TokenRequest request) {
    debugPrint("web token");
    throw UnimplementedError('token() has not been implemented');
  }
}
