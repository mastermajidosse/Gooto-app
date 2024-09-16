// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:gooto/models/user_model.dart';
import 'package:gooto/services/api/api.dart';

class AuthApi {
  Api api = Api();
  // final FirebaseFirestore _firestore= FirebaseFirestore.instance;
  // final FirebaseAuth _auth= FirebaseAuth.instance;

  static final AuthApi _authApi = AuthApi._internal();

  factory AuthApi() {
    return _authApi;
  }

  AuthApi._internal();

  Future<dynamic> login(UserModel user) async {
    return await api.httpPost("v1/users/login", user.logintoJson());
  }

  Future<dynamic> register(UserModel user) async {
    print("registerapi");
    print("user email ${user.email}");
    print("user password ${user.password}");
    return await api.httpPost("v1/users/register", user.registertoJson());
  }
//   Future<String> registerwithfireb(UserModel user)async{
//   String res="Some error Occured";
//   try{
//     UserCredential _credential = await _auth.createUserWithEmailAndPassword(
//       email: user.email!,
//        password: user.password!
       
//        );
//        await _firestore.collection("users").doc(_credential.user!.uid).set({
//         //'name':user.firstname,
//         "email":user.email,
//         'uid':_credential.user!.uid,
//        });
       
// res="Successfulley";
//   }catch(e){
// print(e.toString());
//   }
//   return res;
//   }
//   Future<String> loginwithfireb(UserModel user)async{
//   String res="Some error Occured";
//   try{
//     // UserCredential _credential =
//      await _auth.signInWithEmailAndPassword(
//       email: user.email!,
//        password: user.password! 
//        );
//       //  await _firestore.collection("users").doc(_credential.user!.uid).set({
//       //   'name':user.firstname,
//       //   "email":user.email,
//       //   'uid':_credential.user!.uid,
//       //  });
       
// res="Successfulley";
//   }catch(e){
// print(e.toString());
//   }
//   return res;
//   }


  Future<dynamic> getUserProfile() async {
    return await api.httpGet('v1/users/profile');
  }

  Future<dynamic> getisSign() async {
    var response = await api.httpGetCheck('v1/users/profile');
 print("test$response");
    return response == 401 ? false : true;
   
  }

  // Future<dynamic> logout() async {
  //   return await api.httpPost(jsonEncode({}));
  // }

  // Future<dynamic> recoverPassword(String email) async {
  //   print("{'email': email}");
  //   print({'email': email});
  //   return await api.httpPost(jsonEncode({'email': email}));
  // }
}
