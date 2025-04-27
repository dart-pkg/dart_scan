import 'package:sys/sys.dart' as sys__;
import 'package:pubspec_parse/pubspec_parse.dart';

List<String> _findPackagesInDirectory(List<String> $dirList) {
  final Set<String> $set = <String>{};
  for (int $idx = 0; $idx < $dirList.length; $idx++) {
    String $dir = $dirList[$idx];
    bool $recursive = !$dir.startsWith('*');
    if ($dir.startsWith('*')) {
      $dir = $dir.substring(1);
    }
    //print('${$dir}: ${$recursive}');
    List<String> files = sys__.pathFiles($dir, $recursive);
    List<String> $sources =
        files.where(($x) => sys__.pathExtension($x) == '.dart').toList();
    final $reg = RegExp(r'^import +[^ ]package:([^/]+)/');
    for (int $i = 0; $i < $sources.length; $i++) {
      List<String> $lines = sys__.readFileLines($sources[$i]);
      for (int $j = 0; $j < $lines.length; $j++) {
        String $line = $lines[$j];
        RegExpMatch? $match = $reg.firstMatch($line);
        if ($match != null) {
          $set.add($match.group(1)!);
        }
      }
    }
  }
  final List<String> $list = $set.toList();
  $list.sort((a, b) => a.compareTo(b));
  return $list;
}

List<String> packagesInSourceDirectory(
  List<String> $srcDirList, [
  String? $testDir,
]) {
  List<String> $libPackages = _findPackagesInDirectory($srcDirList);
  List<String> $testPackages =
      $testDir == null
          ? <String>[]
          : _findPackagesInDirectory(<String>[$testDir]);
  for (int $i = 0; $i < $testPackages.length; $i++) {
    if (!$libPackages.contains($testPackages[$i])) {
      $libPackages.add('dev:${$testPackages[$i]}');
    }
  }
  return $libPackages;
}

List<String> _extractHostedDependencies(
  Map<String, Dependency> deps, {
  String prefix = '',
}) {
  List<String> result = <String>[];
  List<String> keys = deps.keys.toList();
  for (int i = 0; i < keys.length; i++) {
    String key = keys[i];
    if (deps[key] is HostedDependency) {
      //HostedDependency dep = deps[key] as HostedDependency;
      //echo(dep.version.toString(), key);
      result.add(prefix + key);
    }
  }
  result.sort((x, y) => x.compareTo(y));
  return result;
}

List<String> findHostedDependenciesInPubspecYaml(String pubspecYamlPath) {
  String text = sys__.readFileString(pubspecYamlPath);
  final pubspec = Pubspec.parse(text);
  Map<String, Dependency> deps = pubspec.dependencies;
  List<String> names = _extractHostedDependencies(deps);
  Map<String, Dependency> devDeps = pubspec.devDependencies;
  List<String> devNames = _extractHostedDependencies(devDeps, prefix: 'dev:');
  List<String> result = <String>[];
  result
    ..addAll(names)
    ..addAll(devNames);
  return result;
}
