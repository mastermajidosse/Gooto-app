import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gooto/models/user_model.dart';
import 'package:gooto/services/service/auth_service.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  UserModel userdata = UserModel();
  UserRepository userRepository = UserRepository();

  registerNew(UserModel new_user, context) async {
    emit(SignupLoading());
    try {
      var response = await userRepository.register(new_user);
      // UserRepository().saveToken(response);
      // userdata = UserModel.fromJson(response);

      // print(myuserModel.email);
      emit(SignupSuccess(userdata));
    } catch (e) {
      emit(SignupError("Couldn't Signup : " + e.toString()));
    }
  }
    registerNewuser(UserModel newUser, context) async {
    emit(SignupLoading());
    try {
      print("SignupLoading");
      var response = await userRepository.register(newUser);
      UserRepository().saveToken(response);
      userdata = UserModel.fromJson(response);
      //print(myuserModel.email);
      emit(SignupSuccess(userdata));
    } catch (e) {
      emit(SignupError("already exists go to log in "));
    }
  }
   Future<void> socialSignOut(context) async {
    emit(SignupLoading());
    try {
      // await GoogleSignIn().signOut();
      // await FacebookAuth.instance.logOut();
      // await FirebaseAuth.instance.signOut();
      await userRepository.signOut();
      print("User Signed Out");
      emit(SignupInitial());
      Phoenix.rebirth(context);
    } catch (error) {
      print("error $error");
    }
  }
}
