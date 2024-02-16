import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail/data/models/inbox_response_model.dart';
import 'package:temp_mail/data/repositories/inbox_repository.dart';
import 'package:temp_mail/logic/cubits/inbox_cubit/inbox_state.dart';

class InboxCubit extends Cubit<InboxState>{
  InboxCubit(): super(InboxInitialState());
  InboxRepository inboxRepository = InboxRepository();

  void fetchInboxes(String token) async {
    try {
      emit(InboxLoadingState());
      Response response = await inboxRepository.fetchInboxs(token);
      if(response.statusCode == 200){
        List<dynamic> responseData = response.data;
        emit(InboxSuccessState(responseData.map((e) => inboxResponseModelFromJson(e)).toList()));
      }
    } on DioException catch (e) {
      emit(InboxFailedState(e.message.toString()));
      
    }
  }
}