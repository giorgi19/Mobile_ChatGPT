import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

typedef AppBuilder = Future<Widget> Function();

Future<void> bootStrap(AppBuilder builder) async {
  await runZonedGuarded<Future<void>>(
    () async {
      runApp(
        await builder(),
      );
    },
    (object, stackTrace) {
      log('$Object : $stackTrace');
    },
  );
}
