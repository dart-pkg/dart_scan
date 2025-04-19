import 'package:sys/sys.dart' as sys;

List<String> _findPackagesInDirectory(String dir) {
  List<String> files = sys.pathFiles(dir);
  List<String> sources =
  files.where((x) => sys.pathExtension(x) == '.dart').toList();
  final reg = RegExp(r'^import[ ]+[^ ]package:([^/]+)/');
  final Set<String> set = <String>{};
  for (int i=0; i<sources.length; i++) {
    List<String> lines = sys.readFileLines(sources[i]);
    for (int j=0; j<lines.length; j++) {
      String line = lines[j];
      RegExpMatch? match = reg.firstMatch(line);
      if (match != null) {
        set.add(match.group(1)!);
      }
    }
  }
  final List<String> list = set.toList();
  list.sort((a, b) => a.compareTo(b));
  return list;
}

List<String> packagesInSourceDirectory(String libDir, [String? testDir]) {
  List<String> libPackages = _findPackagesInDirectory(libDir);
  List<String> testPackages = testDir == null ? <String>[] : _findPackagesInDirectory(testDir);
  for (int i=0; i<testPackages.length; i++) {
    if (!libPackages.contains(testPackages[i])) {
      libPackages.add('dev:${testPackages[i]}');
    }
  }
  return libPackages;
}
