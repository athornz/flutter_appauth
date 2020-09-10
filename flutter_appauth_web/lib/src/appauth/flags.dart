@JS("appAuth")
library flags;

import "package:js/js.dart";
import "package:js/js_util.dart" show promiseToFuture;

@JS()
external get IS_LOG;
@JS()
external get IS_PROFILE;
