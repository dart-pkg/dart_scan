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
      String helloAppDir = path.join(home, 'dart', 'hello', 'app');
      echo(helloAppDir, 'helloDir');
      Set<String> set1 = packagesInSourceDirectory(helloAppDir);
      echo(set1, 'set1');
      echo(set1.toList(), 'set1.toList()');
      List<String> list = set1.toList();
      list.sort((a, b) => a.compareTo(b));
      echo(list, 'list');
    });
    test('run2', () {
      dump('this is run2');
    });
  });
}
