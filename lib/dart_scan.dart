import 'package:std/std.dart' as std_std;
import 'package:pubspec_parse/pubspec_parse.dart' as pubspec_parse;

List<String> _findPackagesInDirectory(List<String> $dirList) {
  final Set<String> $set = <String>{};
  for (int $idx = 0; $idx < $dirList.length; $idx++) {
    String $dir = $dirList[$idx];
    bool $recursive = !$dir.startsWith('*');
    if ($dir.startsWith('*')) {
      $dir = $dir.substring(1);
    }
    //print('${$dir}: ${$recursive}');
    List<String> files = std_std.pathFiles($dir, $recursive);
    List<String> $sources =
        files.where(($x) => std_std.pathExtension($x) == '.dart').toList();
    final $reg = RegExp(r'^(import|export) +[^ ]package:([^/]+)/');
    for (int $i = 0; $i < $sources.length; $i++) {
      List<String> $lines = std_std.readFileLines($sources[$i]);
      for (int $j = 0; $j < $lines.length; $j++) {
        String $line = $lines[$j];
        RegExpMatch? $match = $reg.firstMatch($line);
        if ($match != null) {
          $set.add($match.group(2)!);
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
  Map<String, pubspec_parse.Dependency> deps, {
  String prefix = '',
}) {
  List<String> result = <String>[];
  List<String> keys = deps.keys.toList();
  for (int i = 0; i < keys.length; i++) {
    String key = keys[i];
    if (deps[key] is pubspec_parse.HostedDependency) {
      //HostedDependency dep = deps[key] as HostedDependency;
      //echo(dep.version.toString(), key);
      result.add(prefix + key);
    }
  }
  result.sort((x, y) => x.compareTo(y));
  return result;
}

List<String> findHostedDependenciesInPubspecYaml(String pubspecYamlPath) {
  String text = std_std.readFileString(pubspecYamlPath);
  final pubspec = pubspec_parse.Pubspec.parse(text);
  Map<String, pubspec_parse.Dependency> deps = pubspec.dependencies;
  List<String> names = _extractHostedDependencies(deps);
  Map<String, pubspec_parse.Dependency> devDeps = pubspec.devDependencies;
  List<String> devNames = _extractHostedDependencies(devDeps, prefix: 'dev:');
  List<String> result = <String>[];
  result
    ..addAll(names)
    ..addAll(devNames);
  return result;
}

List<String> _extractGitDependencies(
  Map<String, pubspec_parse.Dependency> deps,
) {
  List<String> result = <String>[];
  List<String> keys = deps.keys.toList();
  for (int i = 0; i < keys.length; i++) {
    String key = keys[i];
    if (deps[key] is pubspec_parse.GitDependency) {
      result.add(key);
    }
  }
  result.sort((x, y) => x.compareTo(y));
  return result;
}

List<String> findGitDependenciesInPubspecYaml(String pubspecYamlPath) {
  String text = std_std.readFileString(pubspecYamlPath);
  final pubspec = pubspec_parse.Pubspec.parse(text);
  Map<String, pubspec_parse.Dependency> deps = pubspec.dependencies;
  List<String> names = _extractGitDependencies(deps);
  return names;
}

List<String> _extractPathDependencies(
  Map<String, pubspec_parse.Dependency> deps,
) {
  List<String> result = <String>[];
  List<String> keys = deps.keys.toList();
  for (int i = 0; i < keys.length; i++) {
    String key = keys[i];
    if (deps[key] is pubspec_parse.PathDependency) {
      result.add(key);
    }
  }
  result.sort((x, y) => x.compareTo(y));
  return result;
}

List<String> findPathDependenciesInPubspecYaml(String pubspecYamlPath) {
  String text = std_std.readFileString(pubspecYamlPath);
  final pubspec = pubspec_parse.Pubspec.parse(text);
  Map<String, pubspec_parse.Dependency> deps = pubspec.dependencies;
  List<String> names = _extractPathDependencies(deps);
  return names;
}
