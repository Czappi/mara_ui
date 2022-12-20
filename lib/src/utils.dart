library core.utils;

import 'dart:io';

class FileUtils {
  FileUtils._();

  static String getExtensionFromPath(String path) {
    String ext = '';

    final separatedPath = path.split(Platform.pathSeparator);

    if (separatedPath.isNotEmpty) {
      final dotSeparated = separatedPath.last.split(".");

      if (dotSeparated.isNotEmpty) {
        ext = dotSeparated.last;
      }
    }

    return ext;
  }
}
