import '/models/nasa.dart';
import '/requests/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NasaState {}

class NasaLoadingState extends NasaState{}

class NasaLoadedState extends NasaState{
  Nasa data;
  NasaLoadedState({required  this.data});
}

class NasaErrorState extends NasaState{}


class NasaCubit extends Cubit<NasaState> {
  NasaCubit() : super(NasaLoadingState());

  Future<void> loadData()async {
    try{
      Map<String, dynamic> apiData = await getNasaData();
      Nasa nasaData = Nasa.fromJson(apiData);
      emit(NasaLoadedState(data: nasaData));
      return;
    }  catch (e, stacktrace) {
    print('Ошибка при загрузке данных: $e');
    print(stacktrace);
    emit(NasaErrorState());
  }
  }
}