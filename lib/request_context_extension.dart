import 'package:dart_frog/dart_frog.dart';

extension RequestContextExtension on RequestContext {
  Future<T> readAsync<T extends Object>() => read<Future<T>>();
}
