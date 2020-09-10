@JS("appAuth")
library authorization_service_configuration;

import "package:js/js.dart";
import "xhr.dart" show Requestor;
import "package:js/js_util.dart" show promiseToFuture;

/// Represents AuthorizationServiceConfiguration as a JSON object.
@anonymous
@JS()
abstract class AuthorizationServiceConfigurationJson {
  external String get authorization_endpoint;
  external set authorization_endpoint(String v);
  external String get token_endpoint;
  external set token_endpoint(String v);
  external String get revocation_endpoint;
  external set revocation_endpoint(String v);
  external String get end_session_endpoint;
  external set end_session_endpoint(String v);
  external String get userinfo_endpoint;
  external set userinfo_endpoint(String v);
  external factory AuthorizationServiceConfigurationJson(
      {String authorization_endpoint,
      String token_endpoint,
      String revocation_endpoint,
      String end_session_endpoint,
      String userinfo_endpoint});
}

/// Configuration details required to interact with an authorization service.
/// More information at https://openid.net/specs/openid-connect-discovery-1_0-17.html
@JS()
class AuthorizationServiceConfiguration {
  // @Ignore

  external String get authorizationEndpoint;
  external set authorizationEndpoint(String v);
  external String get tokenEndpoint;
  external set tokenEndpoint(String v);
  external String get revocationEndpoint;
  external set revocationEndpoint(String v);
  external String get userInfoEndpoint;
  external set userInfoEndpoint(String v);
  external String get endSessionEndpoint;
  external set endSessionEndpoint(String v);
  external factory AuthorizationServiceConfiguration(
      AuthorizationServiceConfigurationJson request);
  external dynamic
      /*{
        authorization_endpoint: string;
        token_endpoint: string;
        revocation_endpoint: string;
        end_session_endpoint: string | undefined;
        userinfo_endpoint: string | undefined;
    }*/
      toJson();
}

@JS("AuthorizationServiceConfiguration")
abstract class _AuthorizationServiceConfiguration {
  external static Promise<AuthorizationServiceConfiguration> fetchFromIssuer(
      String openIdIssuerUrl,
      [Requestor requestor]);
}

extension AuthorizationServiceConfigurationExtensions
    on AuthorizationServiceConfiguration {
  Future<AuthorizationServiceConfiguration> fetchFromIssuer(
      String openIdIssuerUrl,
      [Requestor requestor]) {
    final Object t = this;
    return promiseToFuture(_AuthorizationServiceConfiguration.fetchFromIssuer(openIdIssuerUrl, requestor));
  }
}

@JS()
abstract class Promise<T> {
  external factory Promise(
      void executor(void resolve(T result), Function reject));
  external Promise then(void onFulfilled(T result), [Function onRejected]);
}
