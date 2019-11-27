class FacilityModel{
  
  final String title;
  final String description;
  final String type;
  final String imageURL;
  final int id;

const FacilityModel(
      {this.title,
        this.description,
        this.type,
        this.imageURL,
        this.id});

  bool isInQuery(String query) {
    return title.toLowerCase().contains(query.toLowerCase());
  }

  FacilityModel copyWith({title, description, type, imageURL, id}) =>
      FacilityModel(
          title: title ?? this.title,
          description: description ?? this.description,
          type: type ?? this.type,
          imageURL: imageURL ?? this.imageURL,
          id: id ?? this.id);
  }