import 'package:temp_mail/data/models/domain_model.dart';

abstract class DomainState {}

class DomainLoadingState extends DomainState{
}

class DomainGotState extends DomainState{
  List<DomainModel> domainModels;
  DomainGotState(this.domainModels);
}

class DomainErrorState extends DomainState{
  String message;
  DomainErrorState(this.message);
}