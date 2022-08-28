import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _fullnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            const TextBold(text: 'Register', color: Colors.black, fontSize: 28),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/register.png',
              height: 220,
            ),
            Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: _fullnameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff303952)),
                          borderRadius: BorderRadius.circular(5)),
                      labelText: "Full Name",
                      border: const OutlineInputBorder()),
                )),
            Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff303952)),
                          borderRadius: BorderRadius.circular(5)),
                      labelText: "Username",
                      border: const OutlineInputBorder()),
                )),
            Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff303952)),
                          borderRadius: BorderRadius.circular(5)),
                      labelText: "Password",
                      border: const OutlineInputBorder()),
                )),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 50, right: 50, top: 0, bottom: 0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                color: const Color(0xff303952),
                onPressed: () {},
                child: const Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 80, right: 80),
                  child: TextRegular(
                      text: 'Continue', color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
