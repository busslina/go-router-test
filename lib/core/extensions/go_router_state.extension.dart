import 'package:go_router/go_router.dart';

extension GoRouterStateExtension on GoRouterState {
  String get asString =>
      'GoRouterState -- Path: $path, Full path: $fullPath, Matched location: $matchedLocation';
}
