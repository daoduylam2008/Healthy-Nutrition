import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

bool isExpired(String token) {
  Map<String, dynamic> payload = JwtDecoder.decode(token);
  List<String> date = payload["expiration date"].split('/');
  final now = DateTime.now();
  final expirationDate = DateTime(
    int.parse(date[2]),
    int.parse(date[1]),
    int.parse(date[0]),
  );
  final bool isExpired = expirationDate.isBefore(now);
  return isExpired;
}

Future<String> readToken() async {
  final storage = FlutterSecureStorage();
  final token = await storage.read(key: 'access_token') ?? "";

  return token;
}

Future<void> writeToken(String token) async {
  final storage = FlutterSecureStorage();
  await storage.write(key: 'access_token', value: token);
}
