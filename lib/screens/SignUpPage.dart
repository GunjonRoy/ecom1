


import 'package:ecommercedemo/screens/login_page.dart';
import 'package:ecommercedemo/services/auth_services.dart';
import 'package:ecommercedemo/services/email_auth_service.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {


  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  Future<void> Sign_Up()async{
      try {
        if (password.text.length >= 6) {
          AuthServices().createAccountWithEmailAndPassword(name.text, email.text, password.text);
//          FirebaseUser newuser = await FirebaseAuth.instance
//              .createUserWithEmailAndPassword(
//              email: email.text, password: password.text);
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailAuthOtp(name.text,email.text,password.text)));
        }
        else{
          showDialog(context: context, builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text("Password is too Short"),
              content: Text('Password should be More Than 5 Character'),
            );
          }
          );
        }
      }
      catch(e){
        print(e);
        if(e == 'The email address is already in use by another account.'){
          showDialog(context: context, builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text("The E-Mail Address is Already in Use"),
            );
          }
          );
        }
      }

  }
//  emailAuth = new EmailAuth(
//  sessionName: "Sample session",
//  );

  /// Configuring the remote server
  //emailAuth.config(remoteServerConfiguration);
  void sendOTP() async {
    //EmailAuth emailAuth =  new EmailAuth(sessionName: "Sample session");
    //emailAuth.config(remoteServerConfiguration);
    EmailAuth.sessionName = 'Excelit-AI E-Commerce';
    var res = await EmailAuth.sendOtp(receiverMail: email.value.text);
    if(res){
      print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Sent OTP Successfully<<<<<<<<<<<<<<<<<<<<<<');
    }else{
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>OTP not Send");
//      showDialog(context: context, builder: (BuildContext context) {
//        return new AlertDialog(
//          title: new Text("Please Enter Valid E-Mail"),
//        );
//      }
//      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Color(0xffffaf38),
//      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: Color(0xffffaf38),
            borderRadius: BorderRadius.circular(15)
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 8,right: 8,top: 80),
            child: Container(
              height: size.height*.65,
              width: size.width*.9,
              decoration: BoxDecoration(
                  color: Color(0xffff9900),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                     SizedBox(height: 100,),
                     _buildNameField(),
                    SizedBox(height: 30,),
                    _buildEmailField(),
                    SizedBox(height: 30,),
                    _buildPasswordField(),
                    SizedBox(height: 30,),
                    _buildSignUpButton()
                  ],
                ),
              ),
            ),
          )
        ),
      ),

    );
  }

  Widget _buildNameField() {
    return TextFormField(
        controller: name,
        maxLines: 1,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
          filled: true,
          labelText: "Name",
          //labelStyle: ,

        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email address can\'t be empty';
          }
          return null;
        }
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
        controller: email,
        maxLines: 1,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
          filled: true,
          labelText: "Email",
          //labelStyle: ,

        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email address can\'t be empty';
          }
          return null;
        }
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
        controller: password,
        obscureText: hidenpass,
        maxLines: 1,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
          filled: true,
          labelText: "Password",
          suffixIcon: InkWell(
            //onTap: VisiblePassword,
            onTap: _togglePassView,
            child: hidenpass? Icon(Icons.visibility_off):Icon(Icons.visibility),
          ),
          //labelStyle: ,

        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email address can\'t be empty';
          }
          return null;
        }
    );
  }

  Widget _buildSignUpButton() {
    final size=MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width*.8,
        height: size.height*.07,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
            ),
            onPressed: ()async{
              print(">>>>>>>>>>SignUp<<<<<<<<<<<");
              //sendOTP();
              Sign_Up().then((value) {
                print(">>>>>>>>>>>>>>>OK<<<<<<<<<<<<<<<<");
              }).then((value) {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignIn()), (route) => false);
              });
            },
            child: Text("SIGN UP",
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black38
              ),
            )
        ),
      ),
    );
  }
  bool hidenpass = true;
  void _togglePassView(){
    setState(() {
      hidenpass = !hidenpass;
    });
  }
}
