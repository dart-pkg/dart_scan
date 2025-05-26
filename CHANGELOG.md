## 0.0.1

- Initial release

## 0.0.2

- Modified dart_scan.dart so that scan exclude comments

## 2025.420.839

- Modified varible names

## 2025.420.1127

- Modified variable names and release.sh

## 2025.420.1449

- Updated deppendency to sys package: sys 2025.420.1441 (was 2025.420.435)

## 2025.421.307

- Update dependent version of sys package

## 2025.421.321

- Modified dart_scan.dart to search .dart files recursively

## 2025.421.2226

- Changed packagesInSourceDirectory() to accept multiple lib dirs

## 2025.424.257

- Updated package dependencies: sys 2025.424.246 (was 2025.421.2149)

## 2025.424.1203

- packagesInSourceDirectory() can be used to search non-recursively

## 2025.426.1603

- Updated dependncies (sys: ^2025.424.246 ==> sys: ^2025.426.1452)

## 2025.426.1731

- Update dependencies: sys: ^2025.426.1725

## 2025.427.1709

- Update dependencies

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-version: 2025.426.1731
+version: 2025.427.1709
-  sys: ^2025.426.1725
+  sys: ^2025.426.2256
-  output: ^1.0.7
+  output: ^2025.426.2027
```

## 2025.427.1743

- Update dependencies

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-version: 2025.427.1709
+version: 2025.427.1743
-  sys: ^2025.426.2256
+  sys: ^2025.427.1718
```

## 2025.427.2004

- Added: List<String> findHostedDependenciesInPubspecYaml(String pubspecYamlPath)

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-version: 2025.427.1743
+version: 2025.427.2004
+  pubspec_parse: ^1.5.0
```

## 2025.428.15

- Added: `List<String> findGitDependenciesInPubspecYaml(String pubspecYamlPath)` and `List<String> findPathDependenciesInPubspecYaml(String pubspecYamlPath)`

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-version: 2025.427.2004
+version: 2025.428.15
```

## 2025.428.1730

- Update package dependencies

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-version: 2025.428.15
+version: 2025.428.1730
-  sys: ^2025.427.1718
+  sys: ^2025.428.1721
-  output: ^2025.426.2027
+  output: ^2025.428.931
```

## 2025.430.1937

- Update package dependencies

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-version: 2025.428.1730
+version: 2025.430.1937
-  sys: ^2025.428.1721
+  sys: ^2025.430.1853
```

## 2025.430.2049

- Update package dependencies

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-version: 2025.430.1937
+version: 2025.430.2049
-  sys: ^2025.430.1853
+  sys: ^2025.430.2029
```

## 2025.501.856

- Update package dependencies

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-version: 2025.430.2049
+version: 2025.501.856
-  sys: ^2025.430.2029
+  sys: ^2025.501.850
```

## 2025.503.13

- Update package dependencies

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-version: 2025.501.856
+version: 2025.503.13
-  sys: ^2025.501.850
+  sys: ^2025.503.6
-  output: ^2025.430.1731
+  output: ^2025.502.1958
```

## 2025.504.1204

- Modified packagesInSourceDirectory() so that it includes 'export package' as well

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-version: 2025.503.13
+version: 2025.504.1204
-  sys: ^2025.503.6
+  sys: ^2025.504.1149
+  debug_output: ^2025.502.2007
-  output: ^2025.502.1958
```

## 2025.526.1920

- Update dependencies

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-version: 2025.504.1204
+version: 2025.526.1920
-  sys: ^2025.504.1149
+  sys: ^2025.526.1802
-  debug_output: ^2025.502.2007
-  lints: ^5.1.1
-  path: ^1.9.1
-  test: ^1.25.15
+  debug_output: ^2025.504.1731
+  lints: ^6.0.0
+  test: ^1.26.2
```
