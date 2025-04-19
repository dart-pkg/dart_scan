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
      final reg = RegExp(r'package:([^/]+)/');
      for (int i=0; i<sources.length; i++) {
        List<String> lines = sys.readFileLines(sources[i]);
        //echo(lines, sources[i]);
        for (int j=0; j<lines.length; j++) {
          String line = lines[j];
          RegExpMatch? match = reg.firstMatch(line);
          if (match != null) {
            echo(match.group(1));
          }

        }
      }
    });
    test('run2', () {
      dump('this is run2');
    });
  });
}
