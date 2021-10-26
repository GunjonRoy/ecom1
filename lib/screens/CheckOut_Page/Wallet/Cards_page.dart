import 'package:ecommercedemo/screens/Cart.dart';
import 'package:ecommercedemo/screens/CheckOut_Page/Wallet/Add_card_page.dart';
import 'package:ecommercedemo/screens/CheckOut_Page/Wallet/edit_card_page.dart';
import 'package:ecommercedemo/screens/profile_page.dart';
import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 95.0),
          child: Text("Cards",style: TextStyle(color: Color(0xffe99400)),),
        ),
      ),
        body: Container(
          //alignment: Alignment.topCenter,
          color: Color(0xffe99400),
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){

                  },
                    child: _buildMasterCard()),
                SizedBox(height: 25,),
                InkWell(
                    onTap: (){

                    },
                    child: _buildVisaCard()),
                SizedBox(height: 20,),
                //_buildNextButton()
              ],
            ),
          ),
        ),
      bottomSheet: _buildNextButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
  Widget _buildBottomNavigationBar() {
    return Container(
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
    );
  }

  Widget _buildMasterCard() {
    final size=MediaQuery.of(context).size;
    return Container(
      height: size.height*.25,
      width: size.width*.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
            colors: [Color(0xfff9ab44),Color(0xfff76f1e)],//Color(0xfff9ab44)
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight),
      ),
      child: Row(
        children: [
          Container(
            height: size.height*.25,
            width: size.width*.7,
            decoration: BoxDecoration(
              color: Color(0xfff9ab44),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5),
                  bottomRight: Radius.circular(222)
              ),
              gradient: LinearGradient(
                  colors: [Color(0xfff9ab44),Color(0xfff76f1e)],//Color(0xfff9ab44)
                  begin: Alignment.bottomCenter,
                  end: Alignment.topRight),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Text("4560",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),),
                      SizedBox(width: 33,),
                      Text("4560",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),),
                      SizedBox(width: 33,),
                      Text("4560",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("Card Holder",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 10),),
                  Text("David Spade",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white,fontSize: 25),)
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 27,),
              SizedBox(
                  height: 30,
                  width: 50,
                  child: Image(image: AssetImage("images/masterCardmain.png"),fit: BoxFit.cover,)
              ),
              SizedBox(height: 15,),
              Text("4560",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),),
              SizedBox(height: 20,),
              Text("Expiry",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 10),),
              Text("09 - 18",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white,fontSize: 25),)
            ],
          )
        ],
      ),
    );
  }
  Widget _buildVisaCard() {
    final size=MediaQuery.of(context).size;
    return Container(
      height: size.height*.25,
      width: size.width*.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
            colors: [Color(0xff1ae77b),Color(0xff01c66a)],//Color(0xfff9ab44)
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight),
      ),
      child: Row(
        children: [
          Container(
            height: size.height*.25,
            width: size.width*.7,
            decoration: BoxDecoration(
              color: Color(0xfff9ab44),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5),
                  bottomRight: Radius.circular(222)
              ),
              gradient: LinearGradient(
                  colors: [Color(0xff1ae77b),Color(0xff01c66a)],//Color(0xfff9ab44)
                  begin: Alignment.bottomCenter,
                  end: Alignment.topRight),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Text("4560",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),),
                      SizedBox(width: 33,),
                      Text("4560",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),),
                      SizedBox(width: 33,),
                      Text("4560",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("Card Holder",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 10),),
                  Text("David Spade",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white,fontSize: 25),)
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 27,),
              SizedBox(
                  height: 20,
                  width: 50,
                  child: Image(image: AssetImage("images/visa.png"),fit: BoxFit.fill,)
              ),
              SizedBox(height: 25,),
              Text("4560",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),),
              SizedBox(height: 20,),
              Text("Expiry",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 10),),
              Text("09 - 18",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white,fontSize: 25),)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xffe99400)
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditCard()));
                    //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Address()), (route) => false);
                  },
                  child: Text("New",style: TextStyle(color: Colors.black),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
