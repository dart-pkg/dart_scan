import 'dart:io' as io;
import 'package:output/output.dart';
import 'package:sys/sys.dart' as sys;
import 'package:path/path.dart' as path;
import 'package:dart_scan/dart_scan.dart';

void main() {
  //var calc = new Calculator();
  //var result = calc.addOne(123);
  //dump(result, 'result');
  String home = sys.getenv('HOME')!;
  echo(home, 'home');
  String helloDir = path.join(home, 'dart', 'hello');
  echo(helloDir, 'helloDir');
  echo(io.Directory(helloDir).existsSync(), 'io.Directory(helloDir).exists()');
}
