import 'dart:io';
import 'dart:math';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.post) {
    final params = await context.request.json();
    final name = params['name'];

    if (name != null && name is String) {
      final id = Random().nextInt(100);
      // Simpan person ke database
      // Kembalikan person yang berhasil ditambahkan
      return Response.json(body: {
        'data': {
          'id': id,
          'name': name,
        }
      });
    } else {
      return Response.json(statusCode: HttpStatus.badRequest, body: {
        'error': {
          'message': 'Name is required',
        }
      });
    }
  } else {
    return Response.json(statusCode: HttpStatus.methodNotAllowed, body: {
      'error': {
        'message': 'Method not allowed',
      }
    });
  }
}
