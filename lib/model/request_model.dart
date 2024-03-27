class RequestModel {
  List<int> statusArray;
  List<dynamic> screenType;
  List<dynamic> responseFormat;
  List<dynamic> globalGalleryIds;
  List<dynamic> categoryIds;
  List<dynamic> docTypes;
  List<dynamic> types;
  int limit;
  int skip;
  String searchingText;

  RequestModel({
    required this.statusArray,
    required this.screenType,
    required this.responseFormat,
    required this.globalGalleryIds,
    required this.categoryIds,
    required this.docTypes,
    required this.types,
    required this.limit,
    required this.skip,
    required this.searchingText,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      statusArray: List<int>.from(json['statusArray']),
      screenType: List<dynamic>.from(json['screenType']),
      responseFormat: List<dynamic>.from(json['responseFormat']),
      globalGalleryIds: List<dynamic>.from(json['globalGalleryIds']),
      categoryIds: List<dynamic>.from(json['categoryIds']),
      docTypes: List<dynamic>.from(json['docTypes']),
      types: List<dynamic>.from(json['types']),
      limit: json['limit'],
      skip: json['skip'],
      searchingText: json['searchingText'],
    );
  }
  static Map<String, dynamic> body() {
    RequestModel request = RequestModel(
      statusArray: [1],
      screenType: [],
      responseFormat: [],
      globalGalleryIds: [],
      categoryIds: [],
      docTypes: [],
      types: [],
      limit: 10,
      skip: 0,
      searchingText: "",
    );
    return request.toJson();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusArray'] = statusArray;
    data['screenType'] = screenType;
    data['responseFormat'] = responseFormat;
    data['globalGalleryIds'] = globalGalleryIds;
    data['categoryIds'] = categoryIds;
    data['docTypes'] = docTypes;
    data['types'] = types;
    data['limit'] = limit;
    data['skip'] = skip;
    data['searchingText'] = searchingText;
    return data;
  }
}
