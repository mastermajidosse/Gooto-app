import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooto/bloc/auth/auth_cubit.dart';
import 'package:gooto/models/user_model.dart';
import 'package:gooto/services/service/auth_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  UserRepository userRepository = UserRepository();

  UserModel userdata = UserModel();

  login(context,UserModel user
 // String email, String pass
  ) async {
    emit(LoginLoading());

    try {
      var response = await userRepository.login(user);
      

      emit(LoginSuccess(userdata));
    } catch (e) {
      emit(LoginError("Couldn't Login : " + e.toString()));
    }
  }
    loginserver(context, String email, String pass) async {
      print("www");
    emit(LoginLoading());
 print("www1");
    try {
       print("www2");
       //var response = await userRepository.login(UserModel(email: email, password: pass));
      userdata = await userRepository.loginserver(UserModel(email: email,password: pass));

      print("profileruser:  ${userdata}");
      emit(LoginSuccess(userdata));
    } catch (e) {
     // emit(LoginError("Couldn't Login : " + e.toString()));
     emit(LoginError("Your Password or Email incorect"+e.toString()));
    }
  }

}
