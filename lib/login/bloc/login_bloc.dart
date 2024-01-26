import 'package:captcha_code_demo/login/bloc/login_event.dart';
import 'package:captcha_code_demo/login/bloc/login_repository.dart';
import 'package:captcha_code_demo/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginRepositoryImp? loginRepository;

  LoginBloc(this.loginRepository) : super(LoginInitialState()){
    on<LoginEvent>(onMapEvent);
  }

  void onMapEvent(LoginEvent event, Emitter<LoginState> emit) async{
    emit(LoginInitialState());
    if(event is UserLoginEvent){
     try{
       var model = await loginRepository?.getLoginData(event.mobileNumber, event.otp, event.captcha);
       if(model != null){
         emit(LoginSuccessfulState(model));
       }else{
         emit(LoginFailedState(''));

       }
     }catch(e){
       emit(LoginFailedState(e.toString()));
     }
    }
  }
}