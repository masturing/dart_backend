import 'package:dart_backend/cache_async_greeting_provider.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler.use(cacheAsyncGreetingProvider());
}

// Handler middleware(Handler handler) {
//   return (context) async {
//     // code before request is handled

//     // print("Chekcing permission: ${context.request.headers['authorization']}");
//     print("Chekcing permission: ${context.request.url}");

//     final response = await handler(context);

//     // code after request is handled

//     print("Making new response");
//     final newResponse =
//         response.copyWith(body: '${await response.body()} Hello whats up?');

//     return newResponse;
//   };
// }
