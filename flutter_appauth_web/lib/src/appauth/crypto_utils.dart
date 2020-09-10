@JS("appAuth")
library crypto_utils;

import "package:js/js.dart";
import "package:js/js_util.dart" show promiseToFuture;

// @JS()
// external String bufferToString(Uint8Array buffer);
// @JS()
// external String urlSafe(Uint8Array buffer);
// @JS()
// external Uint8Array textEncodeLite(String str);

@anonymous
@JS()
abstract class Crypto {
  /// Generate a random string
  external String generateRandom(num size);
}

@anonymous
@JS()
abstract class _Crypto {
  /// Compute the SHA256 of a given code.
  /// This is useful when using PKCE.
  external Promise<String> deriveChallenge(String code);
}

extension CryptoExtensions on Crypto {
  Future<String> deriveChallenge(String code) {
    final Object t = this;
    final _Crypto tt = t;
    return promiseToFuture(tt.deriveChallenge(code));
  }
}

/// The default implementation of the `Crypto` interface.
/// This uses the capabilities of the browser.
@JS()
class DefaultCrypto implements Crypto {
  // @Ignore


  external String generateRandom(num size);
}

@JS("DefaultCrypto")
abstract class _DefaultCrypto {
  external Promise<String> deriveChallenge(String code);
}

extension DefaultCryptoExtensions on DefaultCrypto {
  Future<String> deriveChallenge(String code) {
    final Object t = this;
    final _DefaultCrypto tt = t;
    return promiseToFuture(tt.deriveChallenge(code));
  }
}

@JS()
abstract class Promise<T> {
  external factory Promise(
      void executor(void resolve(T result), Function reject));

  external Promise then(void onFulfilled(T result), [Function onRejected]);
}
