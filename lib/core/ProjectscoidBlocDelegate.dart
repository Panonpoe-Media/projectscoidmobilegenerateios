import 'package:bloc/bloc.dart';
import 'package:projectscoid/app/Env.dart';

class ProjectscoidBlocDelegate extends BlocObserver {

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if(EnvType.DEVELOPMENT == Env.value!.environmentType || EnvType.STAGING == Env.value!.environmentType){
      print(event);
    }

  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if(EnvType.DEVELOPMENT == Env.value!.environmentType || EnvType.STAGING == Env.value!.environmentType){
      print(transition);
    }

  }

  @override

  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
   // print('onError -- cubit: ${cubit.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
    if(EnvType.DEVELOPMENT == Env.value!.environmentType || EnvType.STAGING == Env.value!.environmentType){
      print(error);
    }
  }






}
