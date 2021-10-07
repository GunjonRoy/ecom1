import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercedemo/dataBase/userDataBase.dart';
import 'package:ecommercedemo/screens/Cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  var item, product_name, product_details, price, pic;
  Details(String item, String product_name, String product_details, String price, var pic,){
    this.item=item;
    this.product_name=product_name;
    this.product_details=product_details;
    this.price=price;
    this.pic=pic;

  }
  @override
  _DetailsState createState() => _DetailsState(item,product_name,product_details,price,pic);
}

class _DetailsState extends State<Details> {
  var item, product_name, product_details, price, pic, _category;
  _DetailsState(String item, String product_name, String product_details, String price, var pic,){
    this.item=item;
    this.product_name=product_name;
    this.product_details=product_details;
    this.price=price;
    this.pic=pic;

  }

  String? uid;
  var quantity=1;

  Future<void> sendDataProduct() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    await DataBaseProductService(uid: user.uid)
        .UpdateUserData(product_name, price, _category = this.item,pic,quantity);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFff9f36),
        //automaticallyImplyLeading: false,
        title: Center(child: Text('${this.item}')),

      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                //child: this.pic,
                child: Image(image: NetworkImage(this.pic),
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  color: Color(0xFFff9f36),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${this.product_name}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Details: ' '\n${this.product_details}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 13, top: 10),
                    child: Column(
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                              color: Color(0xFFff9f36),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${this.price}',
                          style: TextStyle(
                              color: Color(0xFFff9f36),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13,left: 160),
                    child: SizedBox(
                      height: 50,
                      width: 110,
                      child: ElevatedButton(
                          //color: Color(0xFFff9f36),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFff9f36)
                          ),
                          onPressed: () {
                            sendDataProduct();
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                          },
                          child: Text('ADD',style: TextStyle(color: Colors.white,fontSize: 20),)
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


