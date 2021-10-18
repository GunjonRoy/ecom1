import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercedemo/dataBase/userDataBase.dart';
import 'package:ecommercedemo/screens/Cart.dart';
import 'package:ecommercedemo/screens/bottomSheetReview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

class Details extends StatefulWidget {
  var item, product_name, product_details, price, pic;
  String? productID;
  Details(String item, String product_name, String product_details,
      String price, var pic, String productID) {
    this.item = item;
    this.product_name = product_name;
    this.product_details = product_details;
    this.price = price;
    this.pic = pic;
    this.productID = productID;
  }
  @override
  _DetailsState createState() => _DetailsState(
      item, product_name, product_details, price, pic, productID!);
}

class _DetailsState extends State<Details> {
  var item, product_name, product_details, price, pic, _category;
  String? productID;
  _DetailsState(String item, String product_name, String product_details,
      String price, var pic, String productID) {
    this.item = item;
    this.product_name = product_name;
    this.product_details = product_details;
    this.price = price;
    this.pic = pic;
    this.productID = productID;
  }

  String? uid;
  var quantity = 0;
  Future<void> sendDataProduct() async {
    //FirebaseUser user = await FirebaseAuth.instance.currentUser();
//    await DataBaseProductService(uid: user.uid)
//        .UpdateUserData(product_name, price, _category = this.item,pic,quantity);
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final CollectionReference userRef = Firestore.instance.collection('E-Commerce');
    await userRef
        .document(user.uid)
        .collection('product')
        .document(productID.toString())
        .setData({
      'imageUrl': pic,
      'Product_Id': productID.toString(),
      'Product_Name': product_name,
      'Product_Price': price,
      'Product_Category': _category = this.item,
      'count': quantity
    });
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
                child: Image(
                  image: NetworkImage(this.pic),
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Color(0xFFff9f36),
                height: MediaQuery.of(context).size.height * 0.25,
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
                      SizedBox(
                        height: 20,
                      ),
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
              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 13, top: 10, bottom: 13),
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
                    padding:
                        const EdgeInsets.only(top: 13, left: 160, bottom: 13),
                    child: SizedBox(
                      height: 50,
                      width: 110,
                      child: ElevatedButton(
                          //color: Color(0xFFff9f36),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFff9f36)),
                          onPressed: () {
                            sendDataProduct();
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                          },
                          child: Text(
                            'ADD',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white12),
                  onPressed: () {
                    _showSheet(productID.toString(),
                        product_name.toString(), product_details.toString(),false);
                  },
                  child: Text("Reviews"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showSheet(String productId,String productName, String productDetails,bool review) {
    showFlexibleBottomSheet<void>(
      minHeight: 0,
      initHeight: 0.65,
      maxHeight: 1,
      context: context,
      builder: (context, controller, offset) {
        return ReviewBottom(
          scrollController: controller,
          bottomSheetOffset: offset,
          productId: productId,
          productName: productName,
          productDetail: productDetails,
          review: review,
        );
      },
      anchors: [0, 0.5, 1],
    );
  }
}

class _BottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  final double bottomSheetOffset;
  final String productId;
  final String productName;
  final String productDetail;
  final bool review;
  const _BottomSheet({
    required this.scrollController,
    required this.bottomSheetOffset,
    required this.productId,
    required this.productName,
    required this.productDetail,
    required this.review,
    Key? key,
  }) : super(key: key);
  //TextEditingController mode=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xFFff9f36),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                padding: EdgeInsets.zero,
                controller: scrollController,
                children: [
                  Text(
                    '${this.productName}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Details: ' '\n${this.productDetail}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: Text(
                      'Reviews ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                      onPressed: () {

                      },
                      child: Text(
                        "Write Your..",
                        style: TextStyle(
                            color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                  ),
                  _buildConditionReviewContainer(review),
                  //_buildUserReviews(productId),
                  Text("dfjghkjdfhgjk")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserReviews(String productId){
//    FirebaseUser user = await FirebaseAuth.instance.currentUser();
//    final CollectionReference userRef = Firestore.instance.collection('E-Commerce');
    return StreamBuilder(
        stream: Firestore.instance
            .collection('product')
            .document('review')
            .collection('Product_Id')
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
//                  this.item = item;
//                  this.product_name =
//                      document['Product_Name'] ?? 'No Product Available';
//                  //this.product_details=product_details;
//                  this.price =
//                      document['Product_Price'] ?? "No Price Available";
//                  this.pic = document['imageUrl'] ?? '';
//                  this.productID = document['Product_Id'] ?? '';
//                  this.quantity = document['count'] ?? ' no quantity is here';
//                  this.total=this.total+(int.parse(this.quantity.toString())*int.parse(this.price.toString()));
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image(
                                image:
                                NetworkImage(document['profile_pic'] ?? ''),
                                height: 100,
                                width: 100,
                                //fit: BoxFit.cover,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  document['User_Name'] ??
                                      'No Product Available',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Comments..',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
//                                  _buildQuantity(
//                                      document['count'] ??
//                                          ' no quantity is here',
//                                      document['Product_Id'] ?? '',
//                                      document['Product_Name'] ??
//                                          'No Product Available',
//                                      document['imageUrl'] ?? '',
//                                      document['Product_Price'] ?? "No Price Available"
//                                  )
                              ],
                            ),
                            _buildShowReviewStar()

                          ],
                        ),
                      ),
                    ),
                  );
                }).toList());
          }
        });
  }

  Widget _buildShowReviewStar() {
    return Container(
      height: 100,
      width: 500,
        color: Color(0xEEFFFF00)
    );
  }

  _buildConditionReviewContainer(bool review) {
    if(review==true){
      return _buildShowReviewStar();
    }else{
      return Container(
          height: 100,
          width: 500,
          color: Color(0xCC00FFFF)
      );;
    }
  }
}

List<Widget> _children = [
  const _TextField(),
  const _TestContainer(color: Color(0xEEFFFF00)),
  const _TextField(),
  const _TestContainer(color: Color(0xDD99FF00)),
  const _TextField(),
  const _TestContainer(color: Color(0xCC00FFFF)),
  const _TextField(),
  const _TestContainer(color: Color(0xBB555555)),
  const _TextField(),
  const _TestContainer(color: Color(0xAAFF5555)),
  const _TextField(),
  const _TestContainer(color: Color(0x9900FF00)),
  const _TextField(),
  const _TestContainer(color: Color(0x8800FF00)),
  const _TextField(),
  const _TestContainer(color: Color(0x7700FF00)),
  const _TextField(),
];

class _TextField extends StatelessWidget {
  const _TextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Enter a search term',
      ),
    );
  }
}

class _TestContainer extends StatelessWidget {
  final Color color;

  const _TestContainer({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: color,
      ),
    );
  }
}


