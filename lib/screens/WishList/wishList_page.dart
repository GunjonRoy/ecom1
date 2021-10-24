//import 'package:e_commerce/E-Com/detail.dart';
import 'package:ecommercedemo/dataBase/userDataBase.dart';
import 'package:ecommercedemo/screens/Cart.dart';
import 'package:ecommercedemo/screens/CheckOut_Page/delivery_page.dart';
import 'package:ecommercedemo/screens/CheckOut_page.dart';
import 'package:ecommercedemo/screens/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {

  FirebaseUser? user;
  Future<void> getUserData() async {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    setState(() {
      user = userData;
    });
  }

  var item,
      product_name,
      product_details,
      price,
      pic,
      _category,
      quantity,
      productID;
  var total=0;
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  //DatabaseReference reference = FirebaseDatabase.instance.reference().child('E-Commerce');

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFFe99400),
      appBar: AppBar(
        backgroundColor: Color(0xFFe99400),
        elevation: 0,
        title: Center(child: Text('Wishlist')),
      ),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection('E-Commerce')
              .document(user!.uid)
              .collection('product')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Text(
                'Loading...',
                style: TextStyle(color: Colors.white),
              );
            } else {
//              this.item=item;
//              this.product_name=product_name;
//              this.product_details=product_details;
//              this.price=price;
//              this.pic=pic;
              return ListView(
                  shrinkWrap: true,
                  children: snapshot.data!.documents.map((document) {
                    this.item = item;
                    this.product_name =
                        document['Product_Name'] ?? 'No Product Available';
                    //this.product_details=product_details;
                    this.price =
                        document['Product_Price'] ?? "No Price Available";
                    this.pic = document['imageUrl'] ?? '';
                    this.productID = document['Product_Id'] ?? '';
                    this.quantity = document['count'] ?? ' no quantity is here';
                    //this.total=this.total+((int.parse(this.quantity.toString())*int.parse(this.price.toString())));
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.red,
                        alignment: Alignment.center,
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Image(
                                  image:
                                  NetworkImage(document['imageUrl'] ?? ''),
                                  height: 100,
                                  width: 100,
                                  //fit: BoxFit.cover,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1,
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      document['Product_Name'] ??
                                          'No Product Available',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Price: ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          document['Product_Price'] ??
                                              "No Product Available",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    _buildQuantity(
                                        document['count'] ?? ' no quantity is here'

                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1,
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList());
            }
          }),
      bottomNavigationBar:_buildBottomNavigationBar(),
    );
  }

  Widget _buildQuantity(var countItem) {
    var count = int.parse(countItem.toString());
    final size = MediaQuery.of(context).size;
    if(count>=1){
      return Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xff00c569),),
        alignment: Alignment.center,
        child: Text("In Stock"),
      );
    }else{
      return Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white12),
        alignment: Alignment.center,
        child: Text("Out of Stock"),
      );
    }
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: MediaQuery.of(context).size.height * .25,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10,bottom: 13),
                child: Column(
                  children: [
                    Text(
                      'TOTAL',
                      style: TextStyle(
                          color: Color(0xFFff9f36),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('\$'+
                        '${this.total}',
                      style: TextStyle(
                          color: Color(0xFFff9f36),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13,left: 165,bottom: 13),
                child: SizedBox(
                  height: 50,
                  width: 155,
                  child: ElevatedButton(
                    //color: Color(0xFFff9f36),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFFff9f36),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                          )
                      ),
                      onPressed: () {
                        //sendDataProduct();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Delivery()));
                      },
                      child: Text('CHECKOUT',style: TextStyle(color: Colors.white,fontSize: 20),)
                  ),
                ),

              )
            ],
          ),
          SizedBox(height: 35,),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Explore',
                    style: TextStyle(color: Color(0xFFfca903)),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                  },
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Color(0xFFfca903),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.12,
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                  },
                  child: Icon(
                    Icons.perm_identity_outlined,
                    color: Color(0xFFfca903),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

