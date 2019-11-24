class UserModel{
  final String name;
  final int id;

  UserModel({this.id,this.name});

  bool isInQuery(String query) {
    return (name.toLowerCase().contains(query.toLowerCase()) );
  }
  bool isIdInQuery(int query) {
    return id == query;
  }

  UserModel copyWith({id,name}) => UserModel(id: id,name: name);
}