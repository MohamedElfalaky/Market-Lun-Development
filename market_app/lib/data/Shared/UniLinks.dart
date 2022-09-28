import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;

class UniLinks {
  static bool _initialUriIsHandled = false;
  static Uri? _initialUri;
  static Uri? _latestUri;
  static Object? _err;
  static StreamSubscription? _sub;

  static void init() {
    _handleIncomingLinks();
    _handleInitialUri();
  }

  static void _handleIncomingLinks() {
    if (!kIsWeb) {
      _sub = uriLinkStream.listen((Uri? uri) {
        print('got uri: $uri');

        _latestUri = uri;
        _err = null;
      });
    }
    // ;
    // onError:
    // (Object err) {
    //   print('got err: $err');

    //   _latestUri = null;
    //   if (err is FormatException) {
    //     _err = err;
    //   } else {
    //     _err = null;
    //   }
    // };
  }

  static Future<void> _handleInitialUri() async {
    if (!_initialUriIsHandled) {
      _initialUriIsHandled = true;
      // _showSnackBar('_handleInitialUri called');
      try {
        final uri = await getInitialUri();
        if (uri == null) {
          print('no initial uri');
        } else {
          print('got initial uri: $uri');
        }
        _initialUri = uri;
      } on PlatformException {
        print('falied to get initial uri');
      } on FormatException catch (err) {
        print('malformed initial uri');
        _err = err;
      }
    }
  }
}
