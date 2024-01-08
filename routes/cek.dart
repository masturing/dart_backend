import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  print("Method: ${context.request.method}");
  print("Uri: ${context.request.uri}");
  print("Url: ${context.request.url}");
  print("Path: ${context.request.uri.path}");
  print("Query: ${context.request.uri.queryParameters}");
  print("Headers: ${context.request.headers}");
  print("Body: ${await context.request.body()}");

  return Response(body: 'This is context check');
}
