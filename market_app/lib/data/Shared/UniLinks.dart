import 'dart:async';
import 'dart:io';

import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;

class UniLinks {
// ...
  static var initialLink;
  static var initialLinkUri;
  static Future<void> initUniLinks() async {
    try {
      initialLink = await getInitialLink();
    } on PlatformException {}
    try {
      initialLinkUri = await getInitialUri();
    } on FormatException {}
  }

  static StreamSubscription? _sub;
  static StreamSubscription? _subUri;

  static Future<void> initUniLink() async {
    _sub = linkStream.listen((String? link) {}, onError: (err) {});
  }

  Future<void> initUniLinkUri() async {
    _subUri = uriLinkStream.listen((Uri? uri) {}, onError: (err) {});
  }
}
