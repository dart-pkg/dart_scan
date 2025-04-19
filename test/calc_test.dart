import 'package:test/test.dart';
import 'package:output/output.dart';
import 'package:dart_scan/dart_scan.dart';

void main() {
  group('Calculator', () {
    test('addOne', () {
      var calc = Calculator();
      var result = calc.addOne(123);
      dump(result, 'result');
      expect(result == 124, isTrue);
    });
  });
}
