//import 'package:e_commerce/E-Com/detail.dart';
import 'package:ecommercedemo/dataBase/userDataBase.dart';
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
  var item, product_name, product_details, price, pic, _category,quantity;

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
            } else{
//              this.item=item;
//              this.product_name=product_name;
//              this.product_details=product_details;
//              this.price=price;
//              this.pic=pic;
              return ListView(
                  shrinkWrap: true,
                  children: snapshot.data!.documents.map((document) {
                    this.item=item;
                    this.product_name=document['Product_Name'] ?? 'No Product Available';
                    //this.product_details=product_details;
                    this.price=document['Product_Price'] ?? "No Product Available";
                    this.pic=document['imageUrl'] ?? '';
                    this.quantity=document['quantity']??' no quantity is here';

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.red,
                        alignment: Alignment.center,
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                  child: Image(image: NetworkImage(
                                      document['imageUrl'] ?? ''),
                                    height: 100,
                                    width: 100,
                                    //fit: BoxFit.cover,
                                    fit: BoxFit.cover,
                                  ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      document['Product_Name'] ?? 'No Product Available',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text('Price: ',
                                          style: TextStyle(
                                            fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            color: Colors.white
                                          ),
                                        ),
                                        Text(
                                          document['Product_Price'] ?? "No Product Available",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    _buildQuantity()
                                  ],
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFe37c22)
                                ),
                                  onPressed: (){
                                    showDialog(context: context, builder: (BuildContext context) {
                                      return new AlertDialog(
                                        title: new Text("Are You sure Want to Delete"),
                                        content: Row(
                                          children: [
                                            ElevatedButton(onPressed: (){
                                              Navigator.pop(context);
                                            }, child: Text('Cancel')),
                                            ElevatedButton(
                                                onPressed: (){
                                                  String productid = document.documentID;
                                                  DocumentReference documentreference = Firestore.instance.collection('E-Commerce').document(user!.uid).collection('product').document(productid);
                                                  documentreference.delete().then((value) => Navigator.pop(context));
                                                }, child: Text('Delete')
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                    );
                                  },
                                  child: Icon(Icons.delete,color: Colors.white,))
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList()
              );
            }
          }),
    );
  }
  var count;
  Widget _buildQuantity(){
    final size=MediaQuery.of(context).size;
    return Container(
      //height: size.height*.01,
      //width: size.width*.01,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white12
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          IconButton(
              onPressed:(){
                setState(()async {
                  if(count<=0){
                    count=0;
                    FirebaseUser user = await FirebaseAuth.instance.currentUser();
                    await DataBaseProductService(uid: user.uid)
                        .UpdateUserData(product_name, price, _category = this.item,pic,quantity);

                  }else{
                    count--;
                  }
                });

              },
              icon: Icon(FontAwesomeIcons.minus,
                size: 8,
              )
          ),
          Text("$count",
            style: TextStyle(
              fontSize: 15
            ),
          ),
          IconButton(
              onPressed:(){
                setState(() {
                  count++;
                });
              },
              icon: Icon(FontAwesomeIcons.plus,
                size: 8,
              )
          )
        ],
      ),
    );
  }
}
