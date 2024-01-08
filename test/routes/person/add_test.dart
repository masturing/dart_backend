import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import '../../../routes/person/add.dart' as route;

class _MockRequestContext extends Mock implements RequestContext {}

class _FakeRequest extends Fake implements Request {
  _FakeRequest({this.httpMethod = HttpMethod.post, this.jsonData = const {}});

  final HttpMethod httpMethod;
  final Map<String, dynamic> jsonData;

  @override
  Future<Map<String, dynamic>> json() async => jsonData;

  @override
  HttpMethod get method => httpMethod;
}

void main() async {
  RequestContext context = _MockRequestContext();
  Request request = _FakeRequest(jsonData: {'name': 'John Doe'});

  when(
    () => context.request,
  ).thenAnswer((invocation) => request);

  var response = await route.onRequest(context);
  var json = await response.json();

  group('Add Test Berhasil', () {
    test('Status Code = OK', () {
      expect(response.statusCode, HttpStatus.ok);
    });
    test('Method POST', () async {
      expect(request.method, HttpMethod.post);
    });

    test("Response memiliki data berupa JSON", () {
      expect(json, isA<Map<String, dynamic>>());
      expect(json, isNotNull);
    });

    test('Name is required', () async {
      expect(json['data']['name'], 'John Doe');
    });

    test('Json memiliki key Data', () {
      expect(json.containsKey('data'), true);
    });

    final person = json['data'];

    test('Data memiliki key id', () {
      expect(person.containsKey('id'), true);
    });

    test('Person memiliki Id integer 0-99', () {
      expect(person['id'], isA<int>());
      expect(person['id'], inInclusiveRange(0, 99));
    });
  });
}
