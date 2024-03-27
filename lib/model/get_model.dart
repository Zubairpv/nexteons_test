class GetDataModel {
  String name;
  String docType;
  int uid;
  String url;

  GetDataModel({
    required this.name,
    required this.docType,
    required this.uid,
    required this.url,
  });

  factory GetDataModel.fromJson(Map<String, dynamic> json) {
    return GetDataModel(
      name: json['_name'],
      docType: getDocTypeString(json['_docType']),
      uid: json['_uid'],
      url: json['_url'],
    );
  }
  static String getDocTypeString(int docTypo) {
    switch (docTypo) {
      case 0:
        return 'Image';
      case 1:
        return 'Video';
      case 2:
        return 'Pdf';
      case 3:
        return 'Audio';
      case 4:
        return 'Document';
      default:
        return 'Unknown';
    }
  }
}
