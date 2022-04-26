import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:projectscoid/models/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:projectscoid/repository/repository.dart';
//import 'package:projectscoid/core/components/helpers/action_helpers.dart';
//import 'dart:async';

class AuthenticationController extends Bloc<AuthenticationEvent, AuthenticationState> {
  final ProjectscoidApplication? application;
AuthenticationController({this.application,required AuthenticationState initialState})
    : super(initialState){
  on<AppStarted>(_appStartedEvent);
  on<LoggedIn>(_loggedInEvent);
  on<LoggedOut>(_loggedOutEvent);

}

  Future<void> setUsernamePref(String username)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', '$username');
  }


  Future<void> setPasswordPref(String password)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', '$password');
  }

@override
AuthenticationState? get initialState => AuthenticationInitial();

 void _appStartedEvent(AppStarted event, Emitter<AuthenticationState> emit)async{
    // final bool hasToken = await userRepository.hasToken();
    // if (currentState is AuthenticationUninitialized) {
    //bool hasToken;
  //  print('here');
    final bool hasToken = await application!.projectsAPIRepository!.getHash();
    // Future.delayed(const Duration(milliseconds: 100), () {
    //  future.then((value){hasToken = value;});
    // });

    if (hasToken) {
      var res = await application!.projectsAPIRepository!.loadAccount();
      var res1 = await application!.projectsAPIRepository!.authenticate(res.asMap()[0]['user_name'],res.asMap()[0]['password'] ) ;
      // print('res1 ===$res1');

      //  LoginResult loginResult = LoginResult.fromJson(jsonDecode(res1));

      if( res1 == 'OK'){
        return emit(AuthenticationAuthenticated());

      }else{
        await application!.projectsAPIRepository!.deleteHash();
        await setUsernamePref('');
        await setPasswordPref('');

        return emit(AuthenticationUnauthenticated());

      }
    } else {
      return emit( AuthenticationUnauthenticated());
    }
    //  }
  //  print('here1');

  }

  void _loggedInEvent(LoggedIn event, Emitter<AuthenticationState> emit)async{

    emit( AuthenticationLoading());
    await application!.projectsAPIRepository!.loadAndSaveToken(event.token!);

    emit( AuthenticationWait());

    return emit( AuthenticationAuthenticated());
  }

  void _loggedOutEvent(LoggedOut event, Emitter<AuthenticationState> emit)async{

  //  yield AuthenticationLoading();
    emit( AuthenticationLoading());
    //await userRepository.deleteToken();
    await application!.projectsAPIRepository!.deleteHash();

   // yield AuthenticationUnauthenticated();
   // return emit( AuthenticationLoading());
    return emit(AuthenticationUnauthenticated());
  }


//@override
}