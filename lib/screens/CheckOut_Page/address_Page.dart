import 'package:ecommercedemo/screens/CheckOut_Page/delivery_page.dart';
import 'package:ecommercedemo/screens/CheckOut_Page/payments_page.dart';
import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  TextEditingController _street_1=TextEditingController();
  TextEditingController _street_2=TextEditingController();
  TextEditingController _city=TextEditingController();
  TextEditingController _state=TextEditingController();
  TextEditingController _country=TextEditingController();
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
                      _buildCustomLine(""),
                      _buildCustomRadiioButton("")
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
                      Text("Payments",style: TextStyle(color: Colors.white70),)
                    ],
                  ),
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
                        child: Text("Billing address is the same as delivery address",style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0,top: 30,right: 22),
                  child: TextFormField(
                    maxLines: 1,
                    controller: _street_1,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Street 1',
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
                    child: TextFormField(
                      maxLines: 1,
                      controller: _street_2,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Street 2',
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
                    child: TextFormField(
                      maxLines: 1,
                      controller: _city,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'City',
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: TextFormField(
                            maxLines: 1,
                            controller: _state,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: 'State',
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
                            controller: _country,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: 'Country',
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
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>Delivery()));
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Delivery()), (route) => false);
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Payments()));
                              //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Address()), (route) => false);
                            },
                            child: Text("Next",style: TextStyle(color: Colors.black),)
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

