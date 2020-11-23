import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // ignore: deprecated_member_use
  Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
  );
  // Email & password Sign Up
  Future<String> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // Update the username
    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = name;
    await currentUser.updateProfile(userUpdateInfo);
    await currentUser.reload();
    return currentUser.uid;
  }

  // Email & Passowrd Sign In
  Future<String> signInUserWithEmailAndPassword(
      String email,
      String password,
      ) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password))
        .uid;
  }

  // Sign Out
  signOut() {
    return _firebaseAuth.signOut();
  }

  // Reset Password
Future sendPasswordResetEmail(String email) async{
    return _firebaseAuth.sendPasswordResetEmail(email: email);
}
}
