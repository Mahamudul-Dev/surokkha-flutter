class PostDataResponseModal {
  PostDataResponseModal({
    required this.result,
    required this.pdfUrl,
  });
  late final bool result;
  late final String pdfUrl;

  PostDataResponseModal.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    pdfUrl = json['pdf_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['result'] = result;
    _data['pdf_url'] = pdfUrl;
    return _data;
  }
}
