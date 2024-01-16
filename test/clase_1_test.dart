import 'package:clase_1/clase_1.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  test('factorial', () {
    expect(factorial(5), 120);
  });
}
