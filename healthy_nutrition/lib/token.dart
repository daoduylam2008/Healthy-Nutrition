import 'package:jwt_decoder/jwt_decoder.dart';

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
