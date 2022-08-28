import 'package:capston/presentation/auth/signup_page.dart';
import 'package:capston/presentation/pages/home_page.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'assets/images/logo.png',
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
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()));
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
                    onPressed: () {},
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
                    onPressed: () {},
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
