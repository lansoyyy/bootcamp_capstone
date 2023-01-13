import 'package:capston/data/services/cloud_functions/create_account.dart';
import 'package:capston/presentation/auth/signup_page.dart';
import 'package:capston/presentation/pages/home_page.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/h.gif',
                  height: 200,
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, right: 30, left: 30),
                    child: TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          hintText: ("Username"),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xff303952),
                          ),
                          border: OutlineInputBorder()),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, right: 30, left: 30),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          hintText: ("Password"),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xff303952),
                          ),
                          border: OutlineInputBorder()),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    color: const Color(0xff303952),
                    onPressed: () async {
                      bool hasInternet =
                          await InternetConnectionChecker().hasConnection;
                      if (hasInternet == true) {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: usernameController.text.trim() +
                                      '@hireme.cdo',
                                  password: passwordController.text.trim());
                          box.write('username',
                              usernameController.text + '@hireme.cdo');

                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } catch (e) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const TextBold(
                                        text: 'Error',
                                        color: Colors.black,
                                        fontSize: 14),
                                    content: TextRegular(
                                        text: "$e",
                                        color: Colors.black,
                                        fontSize: 12),
                                    actions: <Widget>[
                                      MaterialButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        child: const TextBold(
                                            text: 'Close',
                                            color: Colors.black,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ));
                        }
                      } else {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => AlertDialog(
                                  title: const TextBold(
                                      text: 'Cannot Procceed',
                                      color: Colors.black,
                                      fontSize: 14),
                                  content: const TextRegular(
                                      text: 'NO INTERNET CONNECTION',
                                      color: Colors.black,
                                      fontSize: 12),
                                  actions: <Widget>[
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const TextBold(
                                          text: 'Continue',
                                          color: Colors.black,
                                          fontSize: 12),
                                    ),
                                  ],
                                ));
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 80, right: 80),
                      child: TextRegular(
                          text: 'Login', color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const TextBold(text: 'or', color: Colors.black, fontSize: 14),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    color: Colors.blue[700],
                    onPressed: () async {
                      bool hasInternet =
                          await InternetConnectionChecker().hasConnection;
                      if (hasInternet == true) {
                        try {
                          final facebookLogInResult =
                              await FacebookAuth.instance.login();

                          final userData =
                              await FacebookAuth.instance.getUserData();

                          final facebookAuthCredential =
                              FacebookAuthProvider.credential(
                                  facebookLogInResult.accessToken!.token);

                          await FirebaseAuth.instance
                              .signInWithCredential(facebookAuthCredential);

                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } on FirebaseAuthException catch (e) {
                          print(e);
                        }
                      } else {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => AlertDialog(
                                  title: const TextBold(
                                      text: 'Cannot Procceed',
                                      color: Colors.black,
                                      fontSize: 14),
                                  content: const TextRegular(
                                      text: 'NO INTERNET CONNECTION',
                                      color: Colors.black,
                                      fontSize: 12),
                                  actions: <Widget>[
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const TextBold(
                                          text: 'Continue',
                                          color: Colors.black,
                                          fontSize: 12),
                                    ),
                                  ],
                                ));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/fblogo.png',
                            height: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const TextRegular(
                              text: 'Login with Facebook',
                              color: Colors.white,
                              fontSize: 18),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    color: Colors.white,
                    onPressed: () async {
                      bool hasInternet =
                          await InternetConnectionChecker().hasConnection;
                      if (hasInternet == true) {
                        final GoogleSignIn _googleSignIn =
                            GoogleSignIn(scopes: ['email']);

                        try {
                          final googleSignInAccount =
                              await _googleSignIn.signIn();

                          if (googleSignInAccount == null) {
                            return;
                          }
                          final googleSignInAuth =
                              await googleSignInAccount.authentication;
                          final credential = GoogleAuthProvider.credential(
                            accessToken: googleSignInAuth.accessToken,
                            idToken: googleSignInAuth.idToken,
                          );

                          await FirebaseAuth.instance
                              .signInWithCredential(credential);

                          if (box.read('signedIn') == false) {
                            try {
                              createAccountFirestore(
                                  googleSignInAccount.email,
                                  googleSignInAccount.photoUrl!,
                                  googleSignInAccount.displayName!);

                              box.write('signedIn', true);
                              box.write(
                                'username',
                                googleSignInAccount.email,
                              );
                            } catch (e) {
                              print(e);
                            }
                          }
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } on FirebaseAuthException catch (e) {
                          print(e);
                        }
                      } else {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => AlertDialog(
                                  title: const TextBold(
                                      text: 'Cannot Procceed',
                                      color: Colors.black,
                                      fontSize: 14),
                                  content: const TextRegular(
                                      text: 'NO INTERNET CONNECTION',
                                      color: Colors.black,
                                      fontSize: 12),
                                  actions: <Widget>[
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const TextBold(
                                          text: 'Continue',
                                          color: Colors.black,
                                          fontSize: 12),
                                    ),
                                  ],
                                ));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/googlelogo.png',
                            height: 20,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const TextRegular(
                              text: 'Login with Google',
                              color: Colors.black,
                              fontSize: 18),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextRegular(
                        text: 'No Account?', color: Colors.grey, fontSize: 14),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignupPage()));
                      },
                      child: const TextBold(
                          text: 'Create Now',
                          color: Colors.black,
                          fontSize: 14),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
