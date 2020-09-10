@JS("appAuth")
library authorization_request_handler;

import "package:js/js.dart";
import "authorization_request.dart" show AuthorizationRequest;
import "authorization_response.dart"
    show AuthorizationResponse, AuthorizationError;
import "query_string_utils.dart" show QueryStringUtils;
import "crypto_utils.dart" show Crypto;
import "authorization_service_configuration.dart"
    show AuthorizationServiceConfiguration;
import "package:js/js_util.dart" show promiseToFuture;

/// This type represents a lambda that can take an AuthorizationRequest,
/// and an AuthorizationResponse as arguments.
typedef void AuthorizationListener(
    AuthorizationRequest request,
    AuthorizationResponse /*AuthorizationResponse|Null*/ response,
    AuthorizationError /*AuthorizationError|Null*/ error);

/// Represents a structural type holding both authorization request and response.
@anonymous
@JS()
abstract class AuthorizationRequestResponse {
  external AuthorizationRequest get request;
  external set request(AuthorizationRequest v);
  external AuthorizationResponse /*AuthorizationResponse|Null*/ get response;
  external set response(AuthorizationResponse /*AuthorizationResponse|Null*/ v);
  external AuthorizationError /*AuthorizationError|Null*/ get error;
  external set error(AuthorizationError /*AuthorizationError|Null*/ v);
  external factory AuthorizationRequestResponse(
      {AuthorizationRequest request,
      AuthorizationResponse /*AuthorizationResponse|Null*/ response,
      AuthorizationError /*AuthorizationError|Null*/ error});
}

/// Authorization Service notifier.
/// This manages the communication of the AuthorizationResponse to the 3p client.
@JS()
class AuthorizationNotifier {
  // @Ignore

  external get listener;
  external set listener(v);
  external void setAuthorizationListener(AuthorizationListener listener);

  /// The authorization complete callback.
  external void onAuthorizationComplete(
      AuthorizationRequest request,
      AuthorizationResponse /*AuthorizationResponse|Null*/ response,
      AuthorizationError /*AuthorizationError|Null*/ error);
}

@JS()
external List<String> get BUILT_IN_PARAMETERS;

/// Defines the interface which is capable of handling an authorization request
/// using various methods (iframe / popup / different process etc.).
@JS()
abstract class AuthorizationRequestHandler {
  // @Ignore

  external QueryStringUtils get utils;
  external set utils(QueryStringUtils v);
  external Crypto get crypto;
  external set crypto(Crypto v);
  external factory AuthorizationRequestHandler(
      QueryStringUtils utils, Crypto crypto);
  external AuthorizationNotifier /*AuthorizationNotifier|Null*/ get notifier;
  external set notifier(AuthorizationNotifier /*AuthorizationNotifier|Null*/ v);

  /// A utility method to be able to build the authorization request URL.
  external String buildRequestUrl(
      AuthorizationServiceConfiguration configuration,
      AuthorizationRequest request);

  /// Sets the default Authorization Service notifier.
  external AuthorizationRequestHandler setAuthorizationNotifier(
      AuthorizationNotifier notifier);

  /// Makes an authorization request.
  external void performAuthorizationRequest(
      AuthorizationServiceConfiguration configuration,
      AuthorizationRequest request);
}

@JS("AuthorizationRequestHandler")
abstract class _AuthorizationRequestHandler {
  external Promise<void> completeAuthorizationRequestIfPossible();

  /// Checks if an authorization flow can be completed, and completes it.
  /// The handler returns a `Promise<AuthorizationRequestResponse>` if ready, or a `Promise<null>`
  /// if not ready.
  external Promise<
          AuthorizationRequestResponse /*AuthorizationRequestResponse|Null*/ >
      completeAuthorizationRequest();
}

extension AuthorizationRequestHandlerExtensions on AuthorizationRequestHandler {
  Future<void> completeAuthorizationRequestIfPossible() {
    final Object t = this;
    final _AuthorizationRequestHandler tt = t;
    return promiseToFuture(tt.completeAuthorizationRequestIfPossible());
  }

  Future<AuthorizationRequestResponse /*AuthorizationRequestResponse|Null*/ >
      completeAuthorizationRequest() {
    final Object t = this;
    final _AuthorizationRequestHandler tt = t;
    return promiseToFuture(tt.completeAuthorizationRequest());
  }
}

@JS()
abstract class Promise<T> {
  external factory Promise(
      void executor(void resolve(T result), Function reject));
  external Promise then(void onFulfilled(T result), [Function onRejected]);
}
