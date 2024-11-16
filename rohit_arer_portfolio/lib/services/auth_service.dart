// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   AuthService._privateConstructor();
//   static final AuthService instance = AuthService._privateConstructor();

//   // Future feature: Anonymous sign-in for potential admin access (if needed)
//   Future<User?> signInAnonymously() async {
//     try {
//       UserCredential userCredential = await _firebaseAuth.signInAnonymously();
//       return userCredential.user;
//     } catch (e) {
//       print('Error during anonymous sign-in: $e');
//       return null;
//     }
//   }

//   // Placeholder method for sign-out (if admin access is implemented)
//   Future<void> signOut() async {
//     await _firebaseAuth.signOut();
//   }

//   // Check if the user is signed in (if you decide to add admin access)
//   bool get isSignedIn => _firebaseAuth.currentUser != null;

//   // Get current user (for potential future use)
//   User? get currentUser => _firebaseAuth.currentUser;
// }
