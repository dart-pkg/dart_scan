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
      String libDir = path.join(home, 'pub', 'dart_scan', 'lib');
      String testDir = path.join(home, 'pub', 'dart_scan', 'test');
      String currDir = path.join(home, 'pub', 'dart_scan');
      echo(libDir, 'libDir');
      echo(testDir, 'testDir');
      List<String> list = packagesInSourceDirectory([
        '*$currDir',
        libDir,
      ], testDir);
      echo(list, 'list');
    });
    test('run2', () {
      dump('this is run2');
    });
  });
}
