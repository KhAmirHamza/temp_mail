import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail/data/models/create_account_model.dart';
import 'package:temp_mail/data/models/login_response_model.dart';
import 'package:temp_mail/data/repositories/account_repository.dart';
import 'package:temp_mail/logic/cubits/account_cubit/account_state.dart';

class AccountsCubit extends Cubit<AccountState>{
  AccountsCubit() : super(CreateAccountInitialStateState());

  AccountRepository accountRepository = AccountRepository();

  void createAccount(CreateAccountModel createAccountModel) async {
    try {
      emit(CreateAccountLoadingState());
      Response response = await accountRepository.createAccount(createAccountModel);
      if (response.statusCode == 200) {
        emit(CreateAccountSuccessState());
      }else{
        emit(CreateAccountFailedState(response.statusMessage!));
      }
    } on DioException catch (e) {
      emit(CreateAccountFailedState(e.message.toString()));
    }
  }

  void logInAccount(CreateAccountModel createAccountModel) async {
    try {
      emit(LoginLoadingState());
      Response response = await accountRepository.loginAccount(createAccountModel);
      if(response.statusCode == 200){
        emit(LoginSuccessState(LoginResponseModel.fromJson(response.data)));
      }else{
        emit(LoginFailedState(response.statusMessage.toString()));
      }
    } on DioException catch (e) {
      emit(LoginFailedState(e.message.toString()));
    }
  }

  void passwordVisibility(bool value){
    emit(PasswordVisibilityState(value));
  }



}