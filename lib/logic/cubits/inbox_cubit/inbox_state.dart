import 'package:temp_mail/data/models/inbox_response_model.dart';

abstract class InboxState{}

class InboxInitialState extends InboxState{

}

class InboxLoadingState extends InboxState{

}

class InboxSuccessState extends InboxState{
  List<InboxResponseModel> inboxResponseModels;
  InboxSuccessState(this.inboxResponseModels);
}

class InboxFailedState extends InboxState{
  String message;
  InboxFailedState(this.message);
}