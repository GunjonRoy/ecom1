//import 'package:e_commerce/E-Com/detail.dart';
import 'package:ecommercedemo/dataBase/userDataBase.dart';
import 'package:ecommercedemo/screens/CheckOut_page.dart';
import 'package:ecommercedemo/screens/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}
class _CartState extends State<Cart> {

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
        title: Center(child: Text('Cart')),
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
                                        document['count'] ??
                                            ' no quantity is here',
                                        document['Product_Id'] ?? '',
                                        document['Product_Name'] ??
                                            'No Product Available',
                                        document['imageUrl'] ?? '',
                                        document['Product_Price'] ?? "No Price Available"
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xFFe37c22)),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return new AlertDialog(
                                            title: new Text(
                                                "Are You sure Want to Delete"),
                                            content: Row(
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('Cancel')),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      String productid =
                                                          document.documentID;
                                                      DocumentReference
                                                          documentreference =
                                                          Firestore.instance
                                                              .collection(
                                                                  'E-Commerce')
                                                              .document(
                                                                  user!.uid)
                                                              .collection(
                                                                  'product')
                                                              .document(
                                                                  productid);
                                                      documentreference
                                                          .delete()
                                                          .then((value) =>
                                                              Navigator.pop(
                                                                  context));
                                                    },
                                                    child: Text('Delete'))
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ))
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

  Widget _buildQuantity(var countItem, var _productID, var _productName,var image,var _price) {
    var count = int.parse(countItem.toString());
    final size = MediaQuery.of(context).size;
    return Container(
      //height: size.height*.01,
      //width: size.width*.01,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white12),
      alignment: Alignment.center,
      child: Row(
        children: [
          IconButton(
              onPressed: () async {
                //setState(()async {
                if (count <= 0) {
                  try {
                    count = 0;
                    //total=0;
                    setState(() {
                      this.total=this.total-0;
                    });
                    FirebaseUser user =
                        await FirebaseAuth.instance.currentUser();
                    final CollectionReference userRef =
                        Firestore.instance.collection('E-Commerce');
                    await userRef
                        .document(user.uid)
                        .collection('product')
                        .document(_productID.toString())
                        .updateData({
                      'imageUrl': image,
                      'Product_Id': _productID.toString(),
                      'Product_Name': _productName.toString(),
                      'Product_Price': _price.toString(),
                      'Product_Category': _category = this.item,
                      'count': count
                    });
                  } catch (e) {
                    print(e);
                  }
                } else {
                  try {
                    count--;
                    setState(() {
                      this.total=this.total-int.parse(_price.toString());
                    });
                    FirebaseUser user =
                        await FirebaseAuth.instance.currentUser();
                    final CollectionReference userRef =
                        Firestore.instance.collection('E-Commerce');
                    await userRef
                        .document(user.uid)
                        .collection('product')
                        .document(_productID.toString())
                        .updateData({
                      'imageUrl': image,
                      'Product_Id': _productID.toString(),
                      'Product_Name': _productName.toString(),
                      'Product_Price': _price.toString(),
                      'Product_Category': _category = this.item,
                      'count': count
                    });
                  } catch (e) {
                    print(e);
                  }
//                    FirebaseUser user = await FirebaseAuth.instance.currentUser();
//                    await DataBaseProductService(uid: user.uid)
//                        .UpdateUserData(product_name, price, _category = this.item,pic,count);
                }
                //});
              },
              icon: Icon(
                FontAwesomeIcons.minus,
                size: 8,
              )),
          Text(
            "$count",
            style: TextStyle(fontSize: 15),
          ),
          IconButton(
              onPressed: () async {
                //setState((){
                try {
                  count++;
                  //this.total=this.total+int.parse(_price.toString());
                  setState(() {
                    this.total=this.total+int.parse(_price.toString());
                  });
                  FirebaseUser user = await FirebaseAuth.instance.currentUser();
                  final CollectionReference userRef =
                      Firestore.instance.collection('E-Commerce');
                  await userRef
                      .document(user.uid)
                      .collection('product')
                      .document(_productID.toString())
                      .updateData({
                    'imageUrl': image,
                    'Product_Id': _productID.toString(),
                    'Product_Name': _productName.toString(),
                    'Product_Price': _price.toString(),
                    'Product_Category': _category = this.item,
                    'count': count
                  });
                } catch (e) {
                  print(e);
                }
                //});
              },
              icon: Icon(
                FontAwesomeIcons.plus,
                size: 8,
              ))
        ],
      ),
    );
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOut()));
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
