// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gooto/bloc/profile/profile_cubit.dart';
// import 'package:gooto/services/service/auth_service.dart';

// part 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(AuthInitial());
//   UserRepository userRepository = UserRepository();

//   checkAuth(context) async {
//     try {
//         final String? token = await userRepository.getTokenFromPreferences();
//        print(token);
//       // Check if the token is valid
//       if (token == null || token.isEmpty) {
//         emit(Unauthenticated());
//         return;
        
//       }
//       String sign = await userRepository.getTokenFromPreferences();
      
//       bool response = await userRepository.issigned();
// print(response);
//        print("isSignedIn :" + response.toString());
//       if (response) {
//         print("Authenticated");
//         BlocProvider.of<ProfileCubit>(context).profile();

//         emit(Authenticated(sign));
//       } else {
//         print("Unauthenticated");
//         emit(Unauthenticated());
//       }
//     } catch (_) {
//       print("Unauthenticated");
//       emit(Unauthenticated());
//     }
//   }
// }
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooto/bloc/profile/profile_cubit.dart';
import 'package:gooto/services/service/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final UserRepository userRepository = UserRepository();

  Future<void> checkAuth(context) async {
    try {
      final String? token = await userRepository.getTokenFromPreferences();
      
      // Check if the token is valid
      if (token == null || token.isEmpty) {
        emit(Unauthenticated());
        return;
      }
      
      final bool isSignedIn = await userRepository.issigned();
      print("isSignedIn: $isSignedIn");

      if (isSignedIn) {
        print("Authenticated");
        BlocProvider.of<ProfileCubit>(context).profile();
        emit(Authenticated(token));
      } else {
        print("Unauthenticated");
        emit(Unauthenticated());
      }
    } catch (error) {
      print("Authentication error: $error");
      emit(Unauthenticated());
    }
  }
}