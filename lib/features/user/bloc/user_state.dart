import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
class UserState {
  final bool loading, loaded;
  final Map error;
  final String userName, mobile;
  UserState({
    @required this.loading,
    @required this.loaded,
    @required this.error,
    @required this.userName,
    @required this.mobile,
  });
  factory UserState.initial() {
    return UserState(
      loading: false,
      loaded: false,
      error: null,
      userName: null,
      mobile: null,
    );
  }
  UserState copyWith({
    bool loading,
    bool loaded,
    Map error,
    String userName,
    String mobile,
  }) {
    return UserState(
        loading: loading ?? this.loading,
        loaded: loaded ?? this.loaded,
        error: error ?? this.error,
        userName: userName ?? this.userName,
        mobile: mobile ?? this.mobile);
  }
}