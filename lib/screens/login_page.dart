import 'package:ecommercedemo/screens/Home_page.dart';
import 'package:ecommercedemo/screens/SignUpPage.dart';
import 'package:ecommercedemo/screens/admin_page.dart';
import 'package:ecommercedemo/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  final _formKey =GlobalKey<FormState>();

  final TextEditingController _cntEmail= TextEditingController();
  final TextEditingController _cntPassword= TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(10),
            color: Color(0xffffaf38),
          ),
          //color: Color.fromRGBO(255, 175, 56,1),
          height: size.height,
          width: size.width,
          alignment: Alignment.center,
          child: Form(
              key: _formKey,
              child: Container(
                 height: size.height*.75,
                 width: size.width*.9,
                decoration: BoxDecoration(
                  color: Color(0xffff9900),
                  borderRadius: BorderRadius.circular(10)
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                      child: Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            height: 50,
                            width: size.width*.5,
                            child: Column(
                              children: [
                                Text("Welcome,",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                                Text("Sign in to Continue",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            )
                          ),
                          SizedBox(width: 50,),
                          _buildSignUpButton()
                        ],
                      ),
                    ),
//                SizedBox(
//                width: 250,
//                height: 250,
//                child: Image(
//                  image: AssetImage('images/family.png'),
//                  fit: BoxFit.fill,
//                ),
//              ),
                    const SizedBox(height:20,),
                    const Text("Log In",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8),
                      child: _buildEmailInput(_cntEmail),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8),
                      child: _buildPasswordInput(_cntPassword),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 8,right: 8,bottom: 8),
                      child: _buildSignInButton(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*.9,
                        child: SignInButton(
                          Buttons.Facebook,
                          //mini: true,
                          onPressed: () {},
                        ),
                      ),
                    ),
//                    SizedBox(

//                        width: MediaQuery.of(context).size.width*.9,
//                        child: ElevatedButton(
//                          onPressed: (){
//
//                          },
//                          child: Text("hudai"),
//                        )
//                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*.9,
                        child: SignInButton(
                          Buttons.Google,
                          //mini: true,
                          onPressed: () {

                          },
                        ),
                      ),
                    ),



//                  Padding(
//                    padding: const EdgeInsets.only(top: 20, left: 8,right: 8),
//                    child: _buildSignUpButton(),
//                  ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget _buildEmailInput(TextEditingController _cntEmail) {
    return TextFormField(
        controller: _cntEmail,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          filled: true,
          prefixIcon: IconButton(
            icon: const Icon(
              Icons.mail,
              color: Color(0xff2162AF),
            ),
            onPressed: () {

            },
          ),
          hintText: "Email",
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email address can\'t be empty';
          }
          return null;
        });
  }
  Widget _buildPasswordInput(TextEditingController _cntPassword){
    return TextFormField(
      controller: _cntPassword,
      maxLines: 1,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white
              )
        ),
        filled: true,
        prefixIcon: IconButton(
          icon: const Icon(
            Icons.mail,
            color: Color(0xff2162AF),
          ),
          onPressed: (){

          },
        ),
        hintText: "Password",
        //hintStyle: Colors.white
      ),
      validator: (value){
        if(value==null ||value.isEmpty){
          return 'Password address can\'t be empty';
        }
        return null;
      },
      //keyboardType: TextInputType.,
    );
  }
  Widget _buildSignInButton(){
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width*.9,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white38
        ),
          onPressed: (){
          if(_cntEmail.text=="excelit@gmail.com"){
            AuthServices().signInWithEmailAndPassword(_cntEmail.text, _cntPassword.text);
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Admin()), (route) => false);
          }
          else{
            AuthServices().signInWithEmailAndPassword(_cntEmail.text, _cntPassword.text).then((value) {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage("")), (route) => false);
            });

          }
          },
          child: const Text("Sign in")
      ),
    );
  }

  Widget _buildSignUpButton() {
    
    return TextButton(
        onPressed: (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignUp()), (route) => false);
          
        },
        child: Text("Sign Up",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white
          ),
        )
    );
    
  }



}


