import 'package:firebase_auth/firebase_auth.dart';
class FirebaaseAuthService{
 
  final FirebaseAuth auth= FirebaseAuth.instance;
 
  Future<String?> signUp(String email, String password)async{
    String error='';
   try{
     UserCredential userCredential =
     await auth.createUserWithEmailAndPassword(email: email, password: password);
     return userCredential.user?.email;
   }on FirebaseAuthException catch(e){
      switch(e.code){
        case'email-already-in-use':
        error='Email already in use';
        break;
        case'invalid-email':
        error='invalid email';
        break;
        case'operation-not-allowed':
        error='operation not allowed';
        break;
        case'weak-password':
        error='Weak password';
        break;
        default:
        error='unknown error';
      }
   }
    return error;
  }
 
  Future<String?>signIn(String email,String password)async{
    String error='';
    try{
      UserCredential userCredential=
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user?.email;
    }on FirebaseAuthException catch(e){
      switch(e.code){
        case'invalid-email':
        error='Invalid email';
        break;
        case'user-disabled':
        error='user is disabled';
        break;
        case'user-not-found':
        error='user not found';
        break;
        case'wrong-password':
        error='wrong passsword';
        break;
        default:
        error='unknown error';
      }
    }
    return error;
  }
 
  Future<String?>resetPassword(String email)async{
    String error='succeed';
    try{
      await auth.sendPasswordResetEmail(email: email);
      return error;
    }on FirebaseAuthException catch(e){
      switch (e.code) {
        case 'invalid-email':
          error='invalid-email';
          break;
        case'user-not-found':
          error='user-not-found';
          break;
        default:
          error='Unknown Error : $e';
      }
    }
    return error;
  }
}