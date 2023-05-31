// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

class GlobalService {
  // for view any pdf file without download
  void openLinkInNewTab(String url, String name) async {
    window.open(url, name);
  }

  // for download a pdf file
  void downloadFile(String url, String fileName) async {
    final anchor = AnchorElement(href: url);
    anchor.download = fileName;
    anchor.click();
  }
}
