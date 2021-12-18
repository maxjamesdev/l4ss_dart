import 'dart:io';
import 'support.dart';

void main() {
  print('L4SS Dart - Log4ShellScanner Dart');
  bool __log = true;
  bool __ver = false;

  if (__log && __ver) print('Reading targets file...');
  var targets = new File('./targets.txt').readAsLinesSync();

  if (__log && __ver) print('Preparing for run...');
  L4SSRequest request = new L4SSRequest(__log, __ver);

  if (__log && __ver) print('Starting run...');
  for (String target in targets) {
    if (__log && __ver) print('Target: $target');

    request.run(
      target: target
    );
  }
}