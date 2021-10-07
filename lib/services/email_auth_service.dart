import 'package:ecommercedemo/screens/Home_page.dart';
import 'package:ecommercedemo/screens/login_page.dart';
import 'package:ecommercedemo/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

class EmailAuthOtp extends StatefulWidget {
  String? email,password,name;
  EmailAuthOtp(String name,String email,String password){
    this.email=email;
    this.name=name;
    this.password=password;
  }
  @override
  _EmailAuthOtpState createState() => _EmailAuthOtpState(name!,email!,password!);
}

class _EmailAuthOtpState extends State<EmailAuthOtp> {
  late EmailAuth emailAuth;
  String? email,password,name;
  _EmailAuthOtpState(String name,String email,String password){
    this.email=email;
    this.name=name;
    this.password=password;
  }
  final TextEditingController _otpController = TextEditingController();

  void verifyOTP()async{
    var res = await EmailAuth.validate(receiverMail: email!, userOTP: _otpController.text);
    //validate(receiverMail: email!, userOTP: _otpController.text);
    if(res){
      AuthServices().createAccountWithEmailAndPassword(name.toString(), email.toString(), password.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
    }else{
      showDialog(context: context, builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text("Invalid OTP"),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              new Text("Please Type Valid OTP"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white
                ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Ok'))
            ],
          ),
        );
      }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 80,right: 80),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _otpController,
              decoration: InputDecoration(
                  hintText: "Enter 6 digit OTP",
                  labelText: 'OTP'
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white
            ),
              onPressed: (){
              verifyOTP();
          },
              child: Text('Verifi')
          )
        ],
      ),

    );
  }
}
