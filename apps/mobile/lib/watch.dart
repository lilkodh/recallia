import 'dart:convert';
import 'dart:io';

import 'package:watcher/watcher.dart';

void main() async {
  print('⚡ Custom Auto-Reload Watcher Started...');
  print('Listening for changes inside lib/...');

  // 1. Start the native flutter run process
  final process = await Process.start('flutter', ['run']);

  // Pipe the app's output text straight to your terminal screen
  process.stdout.transform(utf8.decoder).listen(stdout.write);
  process.stderr.transform(utf8.decoder).listen(stderr.write);

  // 2. Watch your lib folder for any file saves
  final directoryWatcher = DirectoryWatcher(Directory.current.path + '/lib');

  directoryWatcher.events.listen((event) {
    // When any file drops a modified save event, inject 'r' into the process!
    if (event.path.endsWith('.dart')) {
      print('\n🔄 Change detected in: ${event.path} ➡️ Auto-Reloading...');
      process.stdin.write('r');
    }
  });
}
