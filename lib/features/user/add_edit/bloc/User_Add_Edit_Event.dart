
import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/userModel.dart';

abstract class UserAddEditEvent extends Equatable{
  UserAddEditEvent([List props = const []]) : super(props);
}

class AddUser extends UserAddEditEvent {
  final UserModel user;

  AddUser({this.user}) : super([user]);

  @override
  String toString() => "AddUser { User ${user.id}";
}

class EditUser extends UserAddEditEvent {
  final UserModel user;

  EditUser({this.user}) : super([user]);

  @override
  String toString() => "EditUser { User ${user.id}";
}