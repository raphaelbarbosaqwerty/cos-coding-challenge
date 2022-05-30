abstract class AuthStates {}

class InitialAuthStates extends AuthStates {}

class LoadingAuthStates extends AuthStates {}

class SuccessAuthStates extends AuthStates {}

class ErrorAuthStates extends AuthStates {
  final String error;

  ErrorAuthStates(this.error);
}
