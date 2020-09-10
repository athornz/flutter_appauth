@JS("appAuth")
library redirect_based_handler;

import "package:js/js.dart";
import "authorization_request_handler.dart"
    show AuthorizationRequestHandler, AuthorizationRequestResponse;
import "storage.dart" show StorageBackend;
import "types.dart" show LocationLike;
import "query_string_utils.dart" show BasicQueryStringUtils;
import "crypto_utils.dart" show Crypto, Promise;
import "authorization_service_configuration.dart"
    show AuthorizationServiceConfiguration;
import "authorization_request.dart" show AuthorizationRequest;
import "package:js/js_util.dart" show promiseToFuture;

/// Represents an AuthorizationRequestHandler which uses a standard
/// redirect based code flow.
@JS()
class RedirectRequestHandler extends AuthorizationRequestHandler {
  // @Ignore

  external StorageBackend get storageBackend;
  external set storageBackend(StorageBackend v);
  external LocationLike get locationLike;
  external set locationLike(LocationLike v);
  external factory RedirectRequestHandler(
      [StorageBackend storageBackend,
      BasicQueryStringUtils utils,
      LocationLike locationLike,
      Crypto crypto]);
  external void performAuthorizationRequest(
      AuthorizationServiceConfiguration configuration,
      AuthorizationRequest request);
}

@JS("RedirectRequestHandler")
abstract class _RedirectRequestHandler {
  /// Attempts to introspect the contents of storage backend and completes the
  /// request.
  external Promise<
          AuthorizationRequestResponse /*AuthorizationRequestResponse|Null*/ >
      completeAuthorizationRequest();
}

extension RedirectRequestHandlerExtensions on RedirectRequestHandler {
  Future<AuthorizationRequestResponse /*AuthorizationRequestResponse|Null*/ >
      completeAuthorizationRequest() {
    final Object t = this;
    final _RedirectRequestHandler tt = t;
    return promiseToFuture(tt.completeAuthorizationRequest());
  }
}
