import 'package:daily_vital/models/appuser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object based on User
  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  // Sign in anonymously
  Future<AppUser?> signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Additional methods for authentication can be added here, such as sign-in with email/password, etc.
}
