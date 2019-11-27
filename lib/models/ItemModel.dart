class ItemModel {
  final int id;
  final String title;
  final String description;
  final String type;
  final String imageURL;

  const ItemModel(
      {this.title, this.description, this.type, this.imageURL, this.id});

  bool isInQuery(String query) {
    return title.toLowerCase().contains(query.toLowerCase());
  }

  static ItemModel fromJson(Map<String, dynamic> json) {
    return  ItemModel(
                  title: json["title"],
                  description: json["description"],
                  id: json["id"],
                  type: json["type"],
                  imageURL: json["imageURL"]
                  );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["type"] = this.type;
    data["description"] = this.description;
    data["title"] = this.title;
    return data;
  }

  ItemModel copyWith({title, description, type, imageURL, id}) => ItemModel(
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      imageURL: imageURL ?? this.imageURL,
      id: id ?? this.id);
}
