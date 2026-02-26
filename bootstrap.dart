#!/usr/bin/env dart

import 'dart:io';

void main() async {
  stdout.writeln('📦 Getting dependencies for all packages...\n');

  var successCount = 0;
  var failCount = 0;

  // Get dependencies for packages
  final packagesDir = Directory('packages');
  if (await packagesDir.exists()) {
    await for (final entity in packagesDir.list()) {
      if (entity is Directory) {
        final pubspecFile = File('${entity.path}/pubspec.yaml');
        if (await pubspecFile.exists()) {
          final packageName = entity.path.split(Platform.pathSeparator).last;
          stdout.writeln('  ▸ $packageName');

          final result = await Process.run(
            'dart',
            ['pub', 'get'],
            workingDirectory: entity.path,
            runInShell: true,
          );

          if (result.exitCode == 0) {
            stdout.writeln('    ✓ Dependencies installed');
            successCount++;
          } else {
            stderr.writeln('    ✗ Failed to install dependencies');
            failCount++;
          }
        }
      }
    }
  }

  // Get dependencies for app
  final appDir = Directory('app');
  if (await appDir.exists()) {
    await for (final entity in appDir.list()) {
      if (entity is Directory) {
        final pubspecFile = File('${entity.path}/pubspec.yaml');
        if (await pubspecFile.exists()) {
          final appName = entity.path.split(Platform.pathSeparator).last;
          stdout.writeln('  ▸ $appName');

          final result = await Process.run(
            'dart',
            ['pub', 'get'],
            workingDirectory: entity.path,
            runInShell: true,
          );

          if (result.exitCode == 0) {
            stdout.writeln('    ✓ Dependencies installed');
            successCount++;
          } else {
            stderr.writeln('    ✗ Failed to install dependencies');
            failCount++;
          }
        }
      }
    }
  }

  stdout.writeln('');
  if (failCount == 0) {
    stdout.writeln(' All packages bootstrapped successfully! ($successCount packages)');
  } else {
    stderr.writeln(
      'Bootstrapped with errors: $successCount succeeded, $failCount failed',
    );
    exit(1);
  }
}
