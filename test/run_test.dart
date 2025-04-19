import 'package:test/test.dart';
import 'package:sys/sys.dart' as sys;
import 'package:output/output.dart';
import 'package:path/path.dart' as path;
//import 'package:dart_scan/dart_scan.dart';

void main() {
  group('Run', () {
    test('run1', () {
      String home = sys.getenv('HOME')!;
      echo(home, 'home');
      String helloAppDir = path.join(home, 'dart', 'hello', 'app');
      echo(helloAppDir, 'helloDir');
      echo(sys.directoryExists(helloAppDir), 'sys.directoryExists(helloDir)');
      List<String> files = sys.pathFiles(helloAppDir);
      //echo(files, 'files');
      List<String> sources =
          files.where((x) => sys.pathExtension(x) == '.dart').toList();
      echo(sources, '$sources');
    });
    test('run2', () {
      dump('this is run2');
    });
  });
}
