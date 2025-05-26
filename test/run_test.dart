import 'package:test/test.dart';
import 'package:std/std.dart' as std_std;
import 'package:debug_output/debug_output.dart';
import 'package:dart_scan/dart_scan.dart';

void main() {
  group('Run', () {
    test('run1', () {
      //String home = sys.getenv('HOME')!;
      //echo(home, title: 'home');
      String libDir = std_std.pathExpand(
        '~/pub/dart_scan/lib',
      ); // path.join(home, 'pub', 'dart_scan', 'lib');
      String testDir = std_std.pathExpand(
        '~/pub/dart_scan/test',
      ); // path.join(home, 'pub', 'dart_scan', 'test');
      String currDir = std_std.pathExpand(
        '~/pub/dart_scan',
      ); // path.join(home, 'pub', 'dart_scan');
      echo(libDir, title: 'libDir');
      echo(testDir, title: 'testDir');
      List<String> list = packagesInSourceDirectory([
        '*$currDir',
        libDir,
      ], testDir);
      echo(list, title: 'list');
      //expect(list.contains('exporting'), isTrue);
    });
    test('run2', () {
      List<String> pkgNames = findHostedDependenciesInPubspecYaml(
        'pubspec.yaml',
      );
      echo(pkgNames);
      expect(pkgNames.contains('pubspec_parse'), isTrue);
      expect(pkgNames.contains('std'), isTrue);
      expect(pkgNames.contains('dev:lints'), isTrue);
      expect(pkgNames.contains('dev:test'), isTrue);
    });
  });
}
