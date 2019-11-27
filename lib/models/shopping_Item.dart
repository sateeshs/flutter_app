class ShoppingItem{
  final int id;
  final String title;
  final double price;
  final String color;
  final String type;

  const ShoppingItem({this.id,this.title,this.price,this.color,this.type});


  static ShoppingItem fromJson(Map<String, dynamic> json) {
    return  ShoppingItem(
                  title: json["title"],
                  price: json["price"],
                  id: json["id"],
                  type: json["type"],
                  color: json["color"]
                  );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["type"] = this.type;
    data["price"] = this.price;
    data["title"] = this.title;
    return data;
  }

   ShoppingItem copyWith({title, description, type, imageURL, id}) => ShoppingItem(
      title: title ?? this.title,
      price: description ?? this.price,
      type: type ?? this.type,
      id: id ?? this.id);
}