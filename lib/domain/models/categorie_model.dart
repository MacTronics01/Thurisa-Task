class GetCategoriesResponse {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  GetCategoriesResponse({this.id, this.name, this.image, this.createdAt, this.updatedAt});

  factory GetCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return GetCategoriesResponse(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      createdAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'creationAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

// Mapping response to a list of GetCategoriesResponse objects
List<GetCategoriesResponse> mapResponseToList(List<dynamic> response) {
  return response.map((json) => GetCategoriesResponse.fromJson(json)).toList();
}
