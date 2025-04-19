import 'package:test/test.dart';
import 'package:sys/sys.dart' as sys;
import 'package:output/output.dart';
import 'package:path/path.dart' as path;
import 'package:dart_scan/dart_scan.dart';

void main() {
  group('Run', () {
    test('run1', () {
      String home = sys.getenv('HOME')!;
      echo(home, 'home');
      String helloDir = path.join(home, 'dart', 'hello');
      echo(helloDir, 'helloDir');
      echo(sys.directoryExists(helloDir), 'sys.directoryExists(helloDir)');
    });
    test('run2', () {
      dump('this is run2');
    });
  });
}
