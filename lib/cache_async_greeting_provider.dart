import 'package:dart_frog/dart_frog.dart';

String? result;

Middleware cacheAsyncGreetingProvider() {
  return provider<Future<String>>((context) async {
    if (result == null) {
      print("Asycn Greeting Provider");
      result = "Hello";
    }
    return result!;
  });
}
