import 'package:flutter/material.dart';
import 'package:omar_ahmed_advanced_app/core/di/dependency_injection.dart';
import 'package:omar_ahmed_advanced_app/doc_app.dart';

import 'core/routing/app_router.dart';

void main() {
  initGetIt();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}