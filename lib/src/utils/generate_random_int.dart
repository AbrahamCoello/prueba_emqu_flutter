import 'dart:math';

int generateRandomInt({int limit = 1000}) {
  final random = Random();
  return random.nextInt(limit);
}
