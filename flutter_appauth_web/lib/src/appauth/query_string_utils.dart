@JS("appAuth")
library query_string_utils;

import "package:js/js.dart";
import "types.dart" show StringMap, LocationLike;
import "package:js/js_util.dart" show promiseToFuture;

/// Query String Utilities.
@anonymous
@JS()
abstract class QueryStringUtils {
  external String stringify(StringMap input);
  external StringMap parse(LocationLike query, [bool useHash]);
  external StringMap parseQueryString(String query);
}

@JS()
class BasicQueryStringUtils implements QueryStringUtils {
  // @Ignore

  external StringMap parse(LocationLike input, [bool useHash]);
  external StringMap parseQueryString(String query);
  external String stringify(StringMap input);
}
