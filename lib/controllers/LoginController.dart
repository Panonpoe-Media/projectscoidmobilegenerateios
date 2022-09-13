import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:projectscoid/controllers/AuthenticationController.dart';
import 'package:projectscoid/models/model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginController extends Bloc<LoginEvent, LoginState> {
  final ProjectscoidApplication? application;
  final AuthenticationController? authenticationBloc;

  LoginController({
    @required this.application,
    @required this.authenticationBloc,
    required LoginState initialState
  })  : assert(application != null)
      ,assert(authenticationBloc != null)
      ,super(initialState){
    on<LoginButtonPressed>(_loginButtonPressedEvent);
    on<NextButtonPressed>(_nextButtonPressedEvent);
    on<ResetError>(_resetErrorEvent);
  }




  @override

  /*
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
  Stream<LoginEvent> events, transitionFn) {
  return super.transformEvents(
  events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }

   */
  EventTransformer<LoginEvent> transform<LoginEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    print(transition);
  }


  Future<String?> _getUsernameSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('username')){
      return prefs.getString('username');
    }else{return '';}



  }
  Future<void> setUsernamePref(String username)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', '$username');
  }


  Future<String?> _getPasswordSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('password')){
      return prefs.getString('password');
    }else{return '';}



  }
  Future<void> setPasswordPref(String password)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', '$password');
  }

  @override
  LoginState get initialState => LoginInitial(username: '',password: '');

  void _loginButtonPressedEvent(LoginButtonPressed event, Emitter<LoginState> emit)async{
    emit( LoginLoading());


    try {
      final token = await application?.projectsAPIRepository?.authenticate(
        event.username!,
        event.password!,
      );
      if(token == 'OK'){
        await setUsernamePref(event.username!);
        await setPasswordPref(event.password!);
        authenticationBloc?.add(LoggedIn(token: token));

       return emit(LoginInitial(username: '',password: ''));
      }else{
        // print('ada disini boss 1 $token');

         return emit( LoginFailure(error: token));
        return emit( LoginFailure(error: 'Wrong username or password.'));
      }
      //final token = '123';

    } catch (error) {
      print('ada disini boss ${error.toString()}');
      return emit( LoginFailure(error: error.toString()));
      // yield LoginInitial(username:event.username , password: event.password);


    }
  }



  void _nextButtonPressedEvent(NextButtonPressed event, Emitter<LoginState> emit)async{
    var username = await _getUsernameSharedPrefs();
    var password = await _getPasswordSharedPrefs();
    return emit( LoginInitial(username:username! , password: password!));
  }

  void _resetErrorEvent(ResetError event, Emitter<LoginState> emit)async{
    return emit( LoginInitial(username:event.username , password: event.password));
  }


  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
  final currentState = state;
    if (event is LoginButtonPressed) {

        yield LoginLoading();


        try {
          final token = await application?.projectsAPIRepository?.authenticate(
            event.username!,
            event.password!,
          );
          if(token == 'OK'){
            await setUsernamePref(event.username!);
            await setPasswordPref(event.password!);
            authenticationBloc?.add(LoggedIn(token: token));

            yield LoginInitial(username: '',password: '');
          }else{
            // print('ada disini boss');
            yield LoginFailure(error: 'Wrong username or password.');
          }
          //final token = '123';

        } catch (error) {
          print('ada disini boss');
          yield LoginFailure(error: error.toString());
         // yield LoginInitial(username:event.username , password: event.password);


        }


    }
    if(event is NextButtonPressed){
      //print('ada disini');
      var username = await _getUsernameSharedPrefs();
      var password = await _getPasswordSharedPrefs();
      yield LoginInitial(username:username! , password: password!);
    }
    if(event is ResetError){
      yield LoginInitial(username:event.username , password: event.password);

    }
  }
}

