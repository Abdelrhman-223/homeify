



import 'dart:io';

import 'package:file_picker/file_picker.dart';

Future<File> pickFile() async {
  final result = await FilePicker.platform.pickFiles(type: FileType.any);
  if (result != null) {
    return File(result.files.single.path!);
  }else {
  return File('');

  }
}