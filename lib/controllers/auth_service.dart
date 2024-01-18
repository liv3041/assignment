import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static String verifyId = "";
//   To send OTP to the user

  static Future sentOtp({
    required String phone,
    required Function errorStep,
    required Function nextStep,
})async{
    await _firebaseAuth.verifyPhoneNumber(
      timeout: Duration(seconds: 30),
        phoneNumber: "+91$phone",
        verificationCompleted: (phoneAuthCredential) async{
          return;
          },
        verificationFailed: (error)async{
          errorStep();
          nextStep();
        },
        codeSent: (verificationId,forcedResendingToken)async{
          verifyId = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId)async{
         errorStep();
         nextStep();
        },
    ).onError((error, stackTrace) {
      errorStep();
      nextStep();
    });
  }

//   verify otp code and login

static Future loginWithOtp({
    required String otp
})async{
    final cred = PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);
    try{
      final user = await _firebaseAuth.signInWithCredential(cred);
      if(user.user!=null){
        return "Success";
      }
      else{
        return "Error in Otp login";
      }
    }
    on FirebaseAuthException catch(e){
      if (e.code == 'invalid-verification-code') {
        return "Invalid OTP code";
      } else if (e.code == 'too-many-requests') {
        return "Too many login attempts. Try again later.";
      } else {
        return "Error: ${e.message}";
      }
    }
    catch(e){
      return e.toString();
    }
}

// to logout the user
static Future logout () async{
    await _firebaseAuth.signOut();
}

// Check whether the user is logged in or not
static Future<bool> isLoggedIn() async{
    var user = _firebaseAuth.currentUser;
    return user != null;
}
}