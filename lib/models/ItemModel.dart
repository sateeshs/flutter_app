class ItemModel{
  final int id;
  final String title;
  final String description;
  final String type;
  final String imageURL;

  const ItemModel(
      {this.title,
        this.description,
        this.type,
        this.imageURL,
        this.id});

  bool isInQuery(String query) {
    return title.toLowerCase().contains(query.toLowerCase());
  }

  ItemModel copyWith({title, description, type, imageURL, id}) =>
      ItemModel(
          title: title ?? this.title,
          description: description ?? this.description,
          type: type ?? this.type,
          imageURL: imageURL ?? this.imageURL,
          id: id ?? this.id);
  }