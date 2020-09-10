@JS("appAuth")
library errors;

import "package:js/js.dart";
import "package:js/js_util.dart" show promiseToFuture;

/// Represents the AppAuthError type.
@JS()
class AppAuthError {
  // @Ignore

  external String get message;
  external set message(String v);
  external dynamic get extras;
  external set extras(dynamic v);
  external factory AppAuthError(String message, [dynamic extras]);
}
