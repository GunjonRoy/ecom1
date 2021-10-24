import 'package:ecommercedemo/screens/Cart.dart';
import 'package:ecommercedemo/screens/profile_page.dart';
import 'package:flutter/material.dart';

class OrderState extends StatefulWidget {
  @override
  _OrderStateState createState() => _OrderStateState();
}

class _OrderStateState extends State<OrderState> {

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 80.0),
          child: Text("My Order",style: TextStyle(color: Color(0xffe99400)),),
        ),
      ),
        body: Container(
          height: size.height,
          width: size.width,
          color: Color(0xffe99400),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Text("20/21\n10:10 AM",style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * .25,),
                    Text("20/21\n10:10 AM",style: TextStyle(color: Colors.white),),
                    SizedBox(height: MediaQuery.of(context).size.width * .25,),
                    Text("20/21\n10:10 AM",style: TextStyle(color: Colors.white),),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: _buildCustomRadiioButton("Checked"),
                    ),
                    _buildCustomLine("Checked"),
                    _buildCustomRadiioButton("Checked"),
                    _buildCustomLine("Checked"),
                    _buildCustomRadiioButton("Checked"),
                    _buildCustomLine(""),
                    _buildCustomRadiioButton(""),
                    _buildCustomLine(""),
                    _buildCustomRadiioButton(""),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 47.0),
                      child: Text("Order Placeed",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                    Text("Dhaka,Bangladesh",style: TextStyle(color: Colors.white),),
                    SizedBox(height: MediaQuery.of(context).size.width * .25,),
                    Text("Order Processed",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    Text("Dhaka,Bangladesh",style: TextStyle(color: Colors.white),),
                    SizedBox(height: MediaQuery.of(context).size.width * .25,),
                    Text("Shipped",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    Text("Dhaka,Bangladesh",style: TextStyle(color: Colors.white),),
                    SizedBox(height: MediaQuery.of(context).size.width * .24,),
                    Text("Out for delivery",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    Text("Dhaka,Bangladesh",style: TextStyle(color: Colors.white),),
                    SizedBox(height: MediaQuery.of(context).size.width * .25,),
                    Text("Delivered",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    Text("Dhaka,Bangladesh",style: TextStyle(color: Colors.white),),
                  ],
                ),
              ],
            ),
          ),
        ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        color: Colors.white,
        child: Row(
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
      ),
    );
  }
  Widget _buildCustomLine(String checked){
    if(checked=="Checked"){
      return Container(
        margin: EdgeInsets.only(
          left: 50,
          //top: 15,
          right: 50,
        ),

        width: 3,
        height:MediaQuery.of(context).size.width * .25,

        color: Color(0xff00c569),
      );
    }else{
      return Container(
        margin: EdgeInsets.only(
          left: 50,
          //top: 100,
          right: 50,
        ),

        width: 3,
        height:MediaQuery.of(context).size.width * .25,

        color: Colors.white,
      );
    }

  }
  Widget _buildCustomRadiioButton(String step){
    if(step=="Checked"){
      return InkWell(
        onTap: (){

        },
        child: Container(
          margin: EdgeInsets.only(
            left: 50,
            //top: 100,
            right: 50,
          ),
          width: 30,
          height: 30,
          decoration: ShapeDecoration(
            shape: CircleBorder(
              side: BorderSide(
                color: Color(0xff00c569),
              ),
            ),
            color: Colors.white,
          ),
          child: Center(
            child: Container(
              height: 15,
              width: 15,
              decoration: ShapeDecoration(
                  shape: CircleBorder(
                      side: BorderSide(color: Color(0xff00c569))),
                  color: Color(0xff00c569)),
            ),
          ),
        ),
      );
    }
    else{
      return Container(
        margin: EdgeInsets.only(
          left: 50,
          //top: 100,
          right: 50,
        ),
        width: 30,
        height: 30,
        decoration: ShapeDecoration(
          shape: CircleBorder(
            side: BorderSide(
              color: Colors.white,
            ),
          ),
          color: Colors.white,
        ),
        child: Center(
          child: Container(
            height: 15,
            width: 15,
            decoration: ShapeDecoration(
                shape: CircleBorder(
                    side: BorderSide(color: Colors.white)),
                color: Colors.white),
          ),
        ),
      );
    }
  }
}
