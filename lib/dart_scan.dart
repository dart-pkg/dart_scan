import 'package:sys/sys.dart' as sys;

Set<String> packagesInSourceDirectory(String helloAppDir) {
  List<String> files = sys.pathFiles(helloAppDir);
  List<String> sources =
  files.where((x) => sys.pathExtension(x) == '.dart').toList();
  final reg = RegExp(r'package:([^/]+)/');
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
  return set;
}