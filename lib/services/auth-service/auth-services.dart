// import 'package:google_sign_in/google_sign_in.dart';
// import 'dart:convert';
// import 'dart:math';
// import 'package:crypto/crypto.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_twitter_login/flutter_twitter_login.dart';
//
// /// Generates a cryptographically secure random nonce, to be included in a
// /// credential request.
// String generateNonce([int length = 32]) {
//   final charset =
//       '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//   final random = Random.secure();
//   return List.generate(length, (_) => charset[random.nextInt(charset.length)])
//       .join();
// }
//
// /// Returns the sha256 hash of [input] in hex notation.
// String sha256ofString(String input) {
//   final bytes = utf8.encode(input);
//   final digest = sha256.convert(bytes);
//   return digest.toString();
// }
//
// Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
//
//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//
//   // Create a new credential
//   final GoogleAuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );
//
//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }
//
// // Future<UserCredential> signInWithFacebook() async {
// //   // Trigger the sign-in flow
// //   final LoginResult result = await FacebookAuth.instance.login();
// //
// //   // Create a credential from the access token
// //   final FacebookAuthCredential facebookAuthCredential =
// //       FacebookAuthProvider.credential(result.accessToken.token);
// //
// //   // Once signed in, return the UserCredential
// //   return await FirebaseAuth.instance
// //       .signInWithCredential(facebookAuthCredential);
// // }
//
// Future<UserCredential> signInWithApple() async {
//   // To prevent replay attacks with the credential returned from Apple, we
//   // include a nonce in the credential request. When signing in in with
//   // Firebase, the nonce in the id token returned by Apple, is expected to
//   // match the sha256 hash of `rawNonce`.
//   final rawNonce = generateNonce();
//   final nonce = sha256ofString(rawNonce);
//
//   // Request credential for the currently signed in Apple account.
//   final appleCredential = await SignInWithApple.getAppleIDCredential(
//     scopes: [
//       AppleIDAuthorizationScopes.email,
//       AppleIDAuthorizationScopes.fullName,
//     ],
//     nonce: nonce,
//   );
//
//   // Create an `OAuthCredential` from the credential returned by Apple.
//   final oauthCredential = OAuthProvider("apple.com").credential(
//     idToken: appleCredential.identityToken,
//     rawNonce: rawNonce,
//   );
//
//   // Sign in the user with Firebase. If the nonce we generated earlier does
//   // not match the nonce in `appleCredential.identityToken`, sign in will fail.
//   return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
// }
//
// Future<UserCredential> signInWithTwitter() async {
//   // Create a TwitterLogin instance
//   final TwitterLogin twitterLogin = new TwitterLogin(
//     consumerKey: '<your consumer key>',
//     consumerSecret: ' <your consumer secret>',
//   );
//
//   // Trigger the sign-in flow
//   final TwitterLoginResult loginResult = await twitterLogin.authorize();
//
//   // Get the Logged In session
//   final TwitterSession twitterSession = loginResult.session;
//
//   // Create a credential from the access token
//   final AuthCredential twitterAuthCredential = TwitterAuthProvider.credential(
//       accessToken: twitterSession.token, secret: twitterSession.secret);
//
//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance
//       .signInWithCredential(twitterAuthCredential);
// }