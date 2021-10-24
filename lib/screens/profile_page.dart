
import 'package:ecommercedemo/screens/CheckOut_Page/address_Page.dart';
import 'package:ecommercedemo/screens/WishList/wishList_page.dart';
import 'Order History/Order_HIstory.dart';
import 'package:ecommercedemo/screens/edie_profile_page.dart';
import 'package:ecommercedemo/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'cart.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //final user = FirebaseAuth.instance.currentUser();
  String? user;
  String? fname,lname,address,gmail,imageurl;
  usr()async{
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    return firebaseUser.displayName.toString();
  }

  _fetch()async{
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if(firebaseUser!=null)
      await Firestore.instance.collection('E-Commerce').document(firebaseUser.uid).get().then((ds){
        fname=ds.data['First_Name'];
        address=ds.data['Address'];
        gmail=ds.data['E-Mail'];
        imageurl = ds.data['Image'];

      }).catchError((e){
        print(e);
      });
  }


  @override
  Widget build(BuildContext context){
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFff6f00),
          body:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35,left: 25),
                      child:
                      FutureBuilder(
                        future: _fetch(),
                        builder: (context,snapshot){
                          if(snapshot.connectionState!= ConnectionState.done)
                            return Text("",style: TextStyle(color: Colors.white),);
                          return Column(
                            children: [
                              CircleAvatar(
                                radius: 90.0,
                                backgroundImage: AssetImage("images/kids.png"),
                                //NetworkImage(imageurl),
                              ),

                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
//                    FutureBuilder(
//                      future: _fetch(),
//                      builder: (context,snapshot){
//                        if(snapshot.connectionState!= ConnectionState.done)
//                          return Text("No Data Available..",style: TextStyle(color: Colors.white),);
//                        return Column(
//                          children: [
//                            Text("$fname",style: TextStyle(color: Colors.white,fontSize: 20),),
//                            Text("$gmail",style:TextStyle(color: Colors.white))
//                          ],
//                        );
//                      },
//                    ),
                    Column(
                      children: [
                        Text(usr().toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
                        Text("$gmail",style:TextStyle(color: Colors.white))
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28,top: 15),
                child: FlatButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));

                }, child: Text('Edit Profile',style: TextStyle(color: Colors.white),)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 33),
                child: Row(
                  children: [
                    Container(
                      color: Colors.yellow,
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: Icon(Icons.add_location_alt_outlined),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.08,),
                    FutureBuilder(
                      future: _fetch(),
                      builder: (context,snapshot){
                        if(snapshot.connectionState!= ConnectionState.done)
                          return Text("No Data Available..",style: TextStyle(color: Colors.white),);
                        return Column(
                          children: [
                            Text("$address",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WishList()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 33),
                  child: Row(
                    children: [
                      Container(
                        color: Colors.yellow,
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Icon(Icons.circle),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.08,),
                      Text('My Wishlist',style: TextStyle(color: Colors.white,fontSize: 20),)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistory()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 33),
                  child: Row(
                    children: [
                      Container(
                        color: Colors.yellow,
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Icon(Icons.circle),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.08,),
                      Text('Order History',style: TextStyle(color: Colors.white,fontSize: 20),)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 33),
                child: Row(
                  children: [
                    Container(
                      color: Colors.yellow,
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: Icon(Icons.folder),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.08,),
                    Text('Track Order',style: TextStyle(color: Colors.white,fontSize: 20),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 33),
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                  },
                  child: Row(
                    children: [
                      Container(
                        color: Colors.yellow,
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Icon(Icons.card_giftcard),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.08,),
                      Text('Carts',style: TextStyle(color: Colors.white,fontSize: 20),)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:15, top: 33),
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>SignIn()), (route) => false);
                  },
                  child: Row(
                    children: [
                      Container(
                        color: Colors.yellow,
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Icon(Icons.login_outlined),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.08,),
                      Text('Log Out',style: TextStyle(color: Colors.white,fontSize: 20),)
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
