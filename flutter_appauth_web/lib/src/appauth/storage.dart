@JS("appAuth")
library storage;

import "package:js/js.dart";
import "package:js/js_util.dart" show promiseToFuture;

import 'crypto_utils.dart';

/// A subset of the `Storage` interface which we need for the backends to work.
/// Essentially removes the indexable properties and readonly properties from
/// `Storage` in lib.dom.d.ts. This is so that a custom type can extend it for
/// testing.
@anonymous
@JS()
abstract class UnderlyingStorage {
  external num get length;
  external void clear();
  external String /*String|Null*/ getItem(String key);
  external void removeItem(String key);
  external void setItem(String key, String data);
}

/// Asynchronous storage APIs. All methods return a `Promise`.
/// All methods take the `DOMString`
/// IDL type (as it is the lowest common denominator).
@JS()
abstract class StorageBackend {
  // @Ignore

}

@JS("StorageBackend")
abstract class _StorageBackend {
  /// When passed a key `name`, will return that key's value.
  external Promise<String /*String|Null*/ > getItem(String name);

  /// When passed a key `name`, will remove that key from the storage.
  external Promise<void> removeItem(String name);

  /// When invoked, will empty all keys out of the storage.
  external Promise<void> clear();

  /// The setItem() method of the `StorageBackend` interface,
  /// when passed a key name and value, will add that key to the storage,
  /// or update that key's value if it already exists.
  external Promise<void> setItem(String name, String value);
}

extension StorageBackendExtensions on StorageBackend {
  Future<String /*String|Null*/ > getItem(String name) {
    final Object t = this;
    final _StorageBackend tt = t;
    return promiseToFuture(tt.getItem(name));
  }

  Future<void> removeItem(String name) {
    final Object t = this;
    final _StorageBackend tt = t;
    return promiseToFuture(tt.removeItem(name));
  }

  Future<void> clear() {
    final Object t = this;
    final _StorageBackend tt = t;
    return promiseToFuture(tt.clear());
  }

  Future<void> setItem(String name, String value) {
    final Object t = this;
    final _StorageBackend tt = t;
    return promiseToFuture(tt.setItem(name, value));
  }
}

/// A `StorageBackend` backed by `localstorage`.
@JS()
class LocalStorageBackend extends StorageBackend {
  // @Ignore

  external get storage;
  external set storage(v);
  external factory LocalStorageBackend([UnderlyingStorage storage]);
}

@JS("LocalStorageBackend")
abstract class _LocalStorageBackend {
  external Promise<String /*String|Null*/ > getItem(String name);
  external Promise<void> removeItem(String name);
  external Promise<void> clear();
  external Promise<void> setItem(String name, String value);
}

extension LocalStorageBackendExtensions on LocalStorageBackend {
  Future<String /*String|Null*/ > getItem(String name) {
    final Object t = this;
    final _LocalStorageBackend tt = t;
    return promiseToFuture(tt.getItem(name));
  }

  Future<void> removeItem(String name) {
    final Object t = this;
    final _LocalStorageBackend tt = t;
    return promiseToFuture(tt.removeItem(name));
  }

  Future<void> clear() {
    final Object t = this;
    final _LocalStorageBackend tt = t;
    return promiseToFuture(tt.clear());
  }

  Future<void> setItem(String name, String value) {
    final Object t = this;
    final _LocalStorageBackend tt = t;
    return promiseToFuture(tt.setItem(name, value));
  }
}
