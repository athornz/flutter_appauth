@JS("appAuth")
library xhr;

import "package:js/js.dart";
import "package:js/js_util.dart" show promiseToFuture;

/// <reference types="jquery" />
/// An class that abstracts away the ability to make an XMLHttpRequest.
@JS()
abstract class Requestor {
  // @Ignore

}

//
// extension RequestorExtensions on Requestor {
//   Future<dynamic /*T*/ > xhr(JQueryAjaxSettings settings) {
//     final Object t = this;
//     final _Requestor tt = t;
//     return promiseToFuture(tt.xhr(settings));
//   }
// }

/// Uses $.ajax to makes the Ajax requests.
@JS()
class JQueryRequestor extends Requestor {
  // @Ignore

}
//
// extension JQueryRequestorExtensions on JQueryRequestor {
//   Future<dynamic /*T*/ > xhr(JQueryAjaxSettings settings) {
//     final Object t = this;
//     final _JQueryRequestor tt = t;
//     return promiseToFuture(tt.xhr(settings));
//   }
// }

/// Uses fetch API to make Ajax requests
@JS()
class FetchRequestor extends Requestor {
  // @Ignore

}
//
// @JS("FetchRequestor")
// abstract class _FetchRequestor {
//   external Promise<dynamic /*T*/ > xhr/*<T>*/(JQueryAjaxSettings settings);
// }
//
// extension FetchRequestorExtensions on FetchRequestor {
//   Future<dynamic /*T*/ > xhr(JQueryAjaxSettings settings) {
//     final Object t = this;
//     final _FetchRequestor tt = t;
//     return promiseToFuture(tt.xhr(settings));
//   }
// }

/// Should be used only in the context of testing. Just uses the underlying
/// Promise to mock the behavior of the Requestor.
@JS()
class TestRequestor extends Requestor {
  // @Ignore

  external factory TestRequestor(Future<dynamic> promise);
}
//
// @JS("TestRequestor")
// abstract class _TestRequestor {
//   external Promise<dynamic> get promise;
//   external set promise(Promise<dynamic> v);
//   external Promise<dynamic /*T*/ > xhr/*<T>*/(JQueryAjaxSettings settings);
// }
//
// extension TestRequestorExtensions on TestRequestor {
//   Future<dynamic> get promise {
//     final Object t = this;
//     final _TestRequestor tt = t;
//     return promiseToFuture(tt.promise);
//   }
//
//   set promise(Future<dynamic> v) {
//     final Object t = this;
//     final _TestRequestor tt = t;
//     tt.promise = Promise<dynamic>(allowInterop((resolve, reject) {
//       v.then(resolve, onError: reject);
//     }));
//   }
//
//   Future<dynamic /*T*/ > xhr(JQueryAjaxSettings settings) {
//     final Object t = this;
//     final _TestRequestor tt = t;
//     return promiseToFuture(tt.xhr(settings));
//   }
// }
