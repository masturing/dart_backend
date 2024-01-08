import 'package:dart_backend/request_context_extension.dart';
import 'package:dart_frog/dart_frog.dart';

/// PATH: /user/[name] to get name in path url
Future<Response> onRequest(RequestContext context, String name) async {
  print("Request is handled");
  final String greeting = await context.readAsync<String>();

  return Response(body: '$greeting $name');
}
