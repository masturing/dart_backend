import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final greet = context.read<String>();
  return Response(body: greet);
}
