import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class TestController extends ChangeNotifier {
  int selectedIndex = 0;
  bool isButtonClicked = false;
  TextEditingController announcementCtrl = TextEditingController();
  List messageList = [];
  onTabChanged(index) {
    selectedIndex = index;
    notifyListeners();
  }

  onCreateButtonClick() {
    isButtonClicked = true;
    notifyListeners();
  }

  String filePath = "";
  String filename = "";
  int fileSize = 0;
  pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      filePath = file.path!;
      filename = file.name;
      fileSize = file.size;
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  uplaodAnnouncement() {
    messageList.add({
      "filePath": filePath,
      "fileName": filename,
      "fileSize": getFileSizeString(bytes: fileSize),
      "message": announcementCtrl.text
    });
    filePath = "";
    filename = "";
    fileSize = 0;
    announcementCtrl.clear();
    notifyListeners();
  }

  static String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ["b", "kb", "mb", "gb", "tb"];
    if (bytes == 0) return '0${suffixes[0]}';
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

  onAnnouncementDelete(index) {
    messageList.removeAt(index);
    notifyListeners();
  }
}
