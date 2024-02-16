import 'package:temp_mail/data/models/login_response_model.dart';

abstract class AccountState{
}
class CreateAccountInitialStateState extends AccountState{
  CreateAccountInitialStateState();
}

class PasswordVisibilityState extends AccountState{
  bool passwordVisibility ;
  PasswordVisibilityState(this.passwordVisibility);
}
class CreateAccountLoadingState extends AccountState{

}

class CreateAccountSuccessState extends AccountState{

}
class CreateAccountFailedState extends AccountState {
String message;
CreateAccountFailedState(this.message);
}

class LoginInitialState extends AccountState{

}
class LoginLoadingState extends AccountState{

}
class LoginSuccessState extends AccountState{
  LoginResponseModel loginResponseModel;
  LoginSuccessState(this.loginResponseModel);
}
class LoginFailedState extends AccountState{
  String message;
  LoginFailedState(this.message);
}