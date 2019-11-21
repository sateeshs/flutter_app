abstract class UserEvent {}
class GetLoginDetails extends UserEvent {}
class SaveUserName extends UserEvent {
  final String username;
  SaveUserName({this.username});
}
class SaveId extends UserEvent {
  final String id;
  SaveId({this.id});
}
class SaveToken extends UserEvent {
  final String token;
  SaveToken({this.token});
}
class RemoveToken extends UserEvent {
  final String token;
  RemoveToken({this.token});
}
class SaveEmail extends UserEvent {
  final String email;
  SaveEmail({this.email});
}
class SaveMobile extends UserEvent {
  final String mobile;
  SaveMobile({this.mobile});
}