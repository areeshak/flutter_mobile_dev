import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String loginValue = "";
  String passwordValue = "";
  String loginText = "Login";
  bool isVisible = true;
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? const Center(child: CircularProgressIndicator(),
      ) :
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[                                                            //Login Text Field + Button: Login
            isVisible ? SizedBox(width: MediaQuery.of(context).size.width*0.7,
              child: TextField(
                controller: _controller1,
                decoration: const InputDecoration(
                    hintText: 'User ID',
                    border: OutlineInputBorder()
                ),
              ),
            ): Text(loginValue,
              style: const TextStyle(fontSize: 20),                                                 //Login Text + Button: Reset
            ),
            isVisible ? const Padding(padding: EdgeInsets.all(12)) : const Padding(padding: EdgeInsets.all(7)),      //Padding
            isVisible ? SizedBox(width: MediaQuery.of(context).size.width*0.7,
              child: TextField(
                controller: _controller2,
                obscureText: true,
                decoration: const InputDecoration(

                    hintText: 'Password',
                    border: OutlineInputBorder()
                ),
              ),
            ):  Text(passwordValue,
              style: const TextStyle(fontSize: 17.5),
            ),
            const Padding(padding: EdgeInsets.all(12)
            ),
            SizedBox(width: MediaQuery.of(context).size.width*0.3,
              height: MediaQuery.of(context).size.width*0.095,
              child: ElevatedButton(onPressed: () async {
                isLoading = !isLoading;
                await Future.delayed(const Duration(seconds: 2));
                if(loginText == "Login")
                {
                  loginValue = _controller1.text;
                  passwordValue = _controller2.text;
                  loginText = "Reset";
                }
                else{
                  loginText = "Login";
                }
                setState(() {
                  isVisible = !isVisible;
                  isLoading = !isLoading;
                  _controller1.clear();
                  _controller2.clear();
                });
              }, child: Text(loginText)
              ),
            ),
          ],
        ),
      ),
    );
  }
}