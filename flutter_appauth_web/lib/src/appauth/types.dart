@JS("appAuth")
library types;

import "package:js/js.dart";
import "package:js/js_util.dart" show promiseToFuture;

@anonymous
@JS()
abstract class StringMap {
  /* Index signature is not yet supported by JavaScript interop. */
}

/// Represents a window.location like object.
@anonymous
@JS()
abstract class LocationLike {
  external String get hash;
  external set hash(String v);
  external String get host;
  external set host(String v);
  external String get origin;
  external set origin(String v);
  external String get hostname;
  external set hostname(String v);
  external String get pathname;
  external set pathname(String v);
  external String get port;
  external set port(String v);
  external String get protocol;
  external set protocol(String v);
  external String get search;
  external set search(String v);
  external void assign(String url);
}
