import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/userModel.dart';

abstract class UserAddEditState extends Equatable {
  UserAddEditState([List props = const []]) : super(props);
}

class StateShowUser extends UserAddEditState {
  @override
  String toString() => 'SearchStateEmpty';
}

class StateLoading extends UserAddEditState {
  @override
  String toString() => 'SearchStateLoading';
}

class AddUserStateSuccess extends UserAddEditState {
  final UserModel user;

  AddUserStateSuccess(this.user) : super([user]);

  @override
  String toString() => 'AddUserSuccess {User: $user }';
}

class EditUserStateSuccess extends UserAddEditState {
  final UserModel user;

  EditUserStateSuccess(this.user) : super([user]);

  @override
  String toString() => 'EditUserSuccess {User: $user }';
}