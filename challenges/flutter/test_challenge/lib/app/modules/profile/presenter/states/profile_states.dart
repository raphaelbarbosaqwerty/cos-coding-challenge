abstract class ProfileState {}

class InitialProfileState extends ProfileState {}

class LoadingProfileState extends ProfileState {}

class LoadedProfileState extends ProfileState {}

class ErrorProfileState extends ProfileState {
  final String error;

  ErrorProfileState(this.error);
}
