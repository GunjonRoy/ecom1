import 'package:ecommercedemo/screens/CheckOut_Page/address_Page.dart';
import 'package:flutter/material.dart';

class Delivery extends StatefulWidget {
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
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
                      _buildCustomLine(""),
                      _buildCustomRadiioButton(""),
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
                      Text("Address",style: TextStyle(color: Colors.white70),),
                      SizedBox(width: 75,),
                      Text("Payments",style: TextStyle(color: Colors.white70),)
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 22.0,top: 100,right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8,bottom: 8),
                            child: Text("Standard Delivery",style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          Text("Order will be delivered between 3 - 5\nbusiness days")
                        ],
                      ),
                      SizedBox(width: 70,),

                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: _buildCustomRadiioButton(""),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0,top: 30,right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8,bottom: 8),
                            child: Text("Next Day Delivery",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          Text("Place your order before 6pm and your items\nwill be delivered the next day")
                        ],
                      ),
                      SizedBox(width: 22,),

                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: _buildCustomRadiioButton(""),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0,top: 30,right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8,bottom: 8),
                            child: Text("Nominated Delivery",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          Text("Pick a particular date from the calendar and\norder will be delivered on selected date")
                        ],
                      ),
                      SizedBox(width: 23,),

                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: _buildCustomRadiioButton(""),
                      )
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
//                      SizedBox(
//                        height: 40,
//                        width: 100,
//                        child: ElevatedButton(
//                            style: ElevatedButton.styleFrom(
//                              side: BorderSide(color: Color(0xffe99400),width: 3),
//                                primary: Colors.white,
//                            ),
//                            onPressed: (){
//                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Address()));
//                              //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Address()), (route) => false);
//                            },
//                            child: Text("Back",style: TextStyle(color: Colors.black),)
//                        ),
//                      ),
                      SizedBox(width: 120,),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xffe99400)
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Address()));
                              //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Address()), (route) => false);
                            },
                            child: Text("Next",style: TextStyle(color: Colors.black),)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
      ),
    );
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
