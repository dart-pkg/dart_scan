import 'package:output/output.dart';
import 'package:dart_scan/dart_scan.dart';

void main() {
  var calc = new Calculator();
  var result = calc.addOne(123);
  dump(result, 'result');
}
