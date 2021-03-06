import 'package:ecommercedemo/screens/CheckOut_Page/Wallet/Cards_page.dart';
import 'package:ecommercedemo/screens/CheckOut_Page/address_Page.dart';
import 'package:ecommercedemo/screens/Home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  TextEditingController _nameOnCard=TextEditingController();
  TextEditingController _cardNumber=TextEditingController();
  TextEditingController _expiryDate=TextEditingController();
  TextEditingController _cvv=TextEditingController();
  //TextEditingController _country=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text("Checkout",style: TextStyle(color: Color(0xffe99400)),),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffe99400),
          height: size.height,
          width: size.width,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0,top: 50,right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildCustomRadiioButton("Checked"),
                      _buildCustomLine("Checked"),
                      _buildCustomRadiioButton("Checked"),
                      _buildCustomLine("Checked"),
                      _buildCustomRadiioButton("Checked")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0,top: 20,right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Delivery",style: TextStyle(color: Colors.white),),
                      SizedBox(width: 78,),
                      Text("Address",style: TextStyle(color: Colors.white),),
                      SizedBox(width: 75,),
                      Text("Payments",style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0,top: 30,right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {}, // Handle your callback.
                        splashColor: Colors.brown.withOpacity(0.5),
                        child: Container(
                          height: 55,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                            image: DecorationImage(
                              image: AssetImage('images/card1.PNG'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          //child: Icon(Icons.,color: Color(0xffe99400),),
                        ),
                      ),
                      SizedBox(width: 24,),
                      InkWell(
                        onTap: () {}, // Handle your callback.
                        splashColor: Colors.brown.withOpacity(0.5),
                        child: Container(
                          height: 55,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: Colors.white
                          ),
                          child: Icon(Icons.credit_card,color: Color(0xffe99400),),
                        ),
                      ),
                      SizedBox(width: 24,),
                      InkWell(
                        onTap: () {}, // Handle your callback.
                        splashColor: Colors.brown.withOpacity(0.5),
                        child: Container(
                          height: 55,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            image: DecorationImage(
                              image: AssetImage('images/Card3.PNG'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 22.0,top: 30,right: 22),
                    child: TextFormField(
                      maxLines: 1,
                      controller: _nameOnCard,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: 'Name on Card',
                          labelStyle: TextStyle(color: Colors.white70),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          )
                      ),
                    )
                ),

                Padding(
                    padding: const EdgeInsets.only(left: 22.0,top: 30,right: 22),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: TextFormField(
                            maxLines: 1,
                            controller: _cardNumber,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: 'Card Number',
                                labelStyle: TextStyle(color: Colors.white70),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                )
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cards()));
                              },
                              child: SizedBox(

                                height: 30,
                                width: 50,
                                child: Image(image: AssetImage("images/masterCardmain.png"),fit: BoxFit.cover,)
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 10,
                                bottom: 0
                              ),
                              color: Colors.white70,
                              height: 1,
                              width: MediaQuery.of(context).size.width*.12,
                            )
                          ],
                        )
                      ],
                    )
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 22.0,top: 30,right: 22),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: TextFormField(
                            maxLines: 1,
                            controller: _expiryDate,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: 'Expiry Date',
                                labelStyle: TextStyle(color: Colors.white70),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                )
                            ),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Flexible(
                          child: TextFormField(
                            maxLines: 1,
                            controller: _cvv,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: 'CVV',
                                labelStyle: TextStyle(color: Colors.white70),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                )
                            ),
                          ),
                        )
                      ],
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0,top: 30,right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCustomRadiioButton2("Checked"),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 22.0),
                        child: Text("Save this card details",style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomSheet: BottomSheet(
          onClosing: (){

          },
          builder: (context){
            return Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              //alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 170,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Color(0xffe99400),width: 1),
                              primary: Colors.white,
                            ),
                            onPressed: (){
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>Address()));
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Address()), (route) => false);
                            },
                            child: Text("Back",style: TextStyle(color: Colors.black),)
                        ),
                      ),
                      SizedBox(width: 20,),
                      SizedBox(
                        height: 40,
                        width: 170,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xffe99400)
                            ),
                            onPressed: (){
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage('electronics')));
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage('electronics')), (route) => false);
                            },
                            child: Text("Next",style: TextStyle(color: Colors.black),
                            )
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
      ),
    );
  }
  Widget _buildCustomRadiioButton2(String checked){
    if(checked=="Checked"){
      return InkWell(
        onTap: (){

        },
        child: Container(
          margin: EdgeInsets.only(
            //left: 25,
            top: 15,
            //right: 0,
          ),
          width: 30,
          height: 30,
          decoration: ShapeDecoration(
            shape: CircleBorder(
              side: BorderSide(
                color: Color(0xff00c569),
              ),
            ),
            color: Color(0xff00c569),
          ),
          child: Center(
            child: Icon(Icons.check,color: Colors.white,),
          ),
        ),
      );
    }
    else{
      return Container(
        margin: EdgeInsets.only(
          //left: 25,
          top: 15,
          //right: 0,
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
  Widget _buildCustomRadiioButton(String step){
    if(step=="Checked"){
      return InkWell(
        onTap: (){

        },
        child: Container(
          margin: EdgeInsets.only(
            //left: 25,
            top: 15,
            //right: 0,
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
          //left: 25,
          top: 15,
          //right: 0,
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
  Widget _buildCustomLine(String checked){
    if(checked=="Checked"){
      return Container(
        margin: EdgeInsets.only(
          //left: 25,
          top: 15,
          //right: 0,
        ),

        width: MediaQuery.of(context).size.width * .25,
        height:3,

        color: Color(0xff00c569),
      );
    }else{
      return Container(
        margin: EdgeInsets.only(
          //left: 25,
          top: 13,
          //right: 0,
        ),

        width: MediaQuery.of(context).size.width * .25,
        height:3,

        color: Colors.white,
      );
    }

  }
}


