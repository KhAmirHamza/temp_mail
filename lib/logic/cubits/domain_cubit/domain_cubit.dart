import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail/data/models/domain_model.dart';
import 'package:temp_mail/data/repositories/domain_repository.dart';
import 'package:temp_mail/logic/cubits/domain_cubit/domain_state.dart';

class DomainCubit extends Cubit<DomainState>{
  DomainCubit(): super(DomainLoadingState()){
    fetchDomain();
  }

  DomainRepository domainRepository = DomainRepository();

  void fetchDomain() async {
    try {
      emit(DomainLoadingState());
      List<DomainModel> domainModels = await domainRepository.fetchDoamins();
      emit(DomainGotState(domainModels));

    } on DioException catch (e) {
      emit(DomainErrorState(e.message.toString()));
    }
  }
}