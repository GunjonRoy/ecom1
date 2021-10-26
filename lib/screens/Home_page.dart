import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercedemo/main.dart';
import 'package:ecommercedemo/screens/Cart.dart';
import 'package:ecommercedemo/screens/product_details_page.dart';
import 'package:ecommercedemo/screens/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);
  String? category;
  HomePage(String category){
    this.category=category;
  }
  @override
  _HomePageState createState() => _HomePageState(category!);
}
class _HomePageState extends State<HomePage> {

  String? category;
  _HomePageState(String category){
    this.category=category;
  }


  int m=0;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffe7b35a),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          ),
        ),
        // actions: <Widget>[
        //   IconButton(icon: Icon(Icons.search),
        //       onPressed: () {
        //         //showSearch(context: context, delegate: DataSearch(listWords));
        //       })
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 30,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      //color: Color(0xffffaf38),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  alignment: Alignment.center,
                  height: 100,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Categories",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 23),),
                      SizedBox(height: 20,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      shape: CircleBorder(),
                                      //padding: EdgeInsets.all(30)
                                    ),
                                      onPressed: (){
                                      mode=1;
                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage('Kids')), (route) => false);

                                      },
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage("images/kids.png"),
                                        radius: 30,
                                      ),
                                  ),
                                  Text("Kids")
                                ],
                              ),
                              Column(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      shape: CircleBorder(),
                                      //padding: EdgeInsets.all(30)
                                    ),
                                    onPressed: (){
                                      mode=2;
                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage('Device')), (route) => false);
                                    },
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage("images/mensitem.png"),
                                      radius: 30,
                                    ),
                                  ),
                                  Text('Devices')
                                ],
                              ),
                              Column(
                                children: [
                                  ElevatedButton(
                                      onPressed: (){
                                        mode=3;
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage('men')), (route) => false);
                                      },
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage("images/men's.png"),
                                        radius: 30,
                                      ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      shape: CircleBorder()
                                    ),
                                  ),
                                  Text("Men's")
                                ],
                              ),
                              Column(
                                children: [
                                  ElevatedButton(
                                      onPressed: (){
                                        mode=4;
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage("Women")), (route) => false);
                                      },
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage("images/girls.png"),
                                        radius: 30,
                                      ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      shape: CircleBorder()
                                    ),
                                  ),
                                  Text("Women")
                                ],
                              ),
                              Column(
                                children: [
                                  ElevatedButton(
                                      onPressed: (){
                                        mode=5;
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage('electronics')), (route) => false);
                                      },
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage("images/Devices.png"),
                                        radius: 30,
                                      ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      shape: CircleBorder()
                                    ),
                                  ),
                                  Text("Electronics")
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    //color: Color(0xffffaf38),
                    borderRadius: BorderRadius.circular(15)
                  ),

                  alignment: Alignment.center,
                  height: size.height,
                  width: size.width,
                   child: _buildcondition(category!)
                  // Column(
                  //   children: [
                  //     _buildDefuListView()
                  //     // if (mode == 0) ...[
                  //     //   _buildDefuListView()
                  //     // ] else if (mode == 5) ...[
                  //     //   _buildListView(mode)
                  //     // ]
                  //   ],
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(

                accountName: Text("Gunjon Roy"),
                accountEmail: Text("gunjon.cse@gmail.com"),
              currentAccountPicture: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("images/men's.png"),
                child: Text("Edit"),
              ),

            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("Carts"),
              onTap: (){
                print("hello world<<<<<<<<<<<<>>>>>>>>>>>>>>");
              },
            )
          ],
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
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage("")), (route) => false);
                },
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

  Widget _buildListView(String mode){
    // String? who;
    // if(number==5){
    //   who="kids";
    // }else if(number==16){
    //   who="boys";
    // }else if(number==18){
    //   who="mens";
    // }else if(number==21){
    //   who="girls";
    // }else{
    //   who="";
    // }
    //var item = '';
    final size=MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('product').document(mode).collection(mode).snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Column(
              children: [
                CircularProgressIndicator(),
                Text('Loading...',style: TextStyle(color: Colors.white),),
              ],
            ));
          } else
            return SingleChildScrollView(
              child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: snapshot.data!.documents.map((document){
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffe7b35a)
                      ),
                      onPressed:(){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                    mode,
                                    document['name'] ?? '',
                                    document['details'] ?? '',
                                    document['price'] ?? '',
                                    document['imageUrl'] ?? '',
                                    document['Product_Id'] ?? ''
                                )));

                      },
                      child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //NetworkImage(),
                              Card(
                                elevation: 20,
                                color: Colors.white,
                                //BoxDecoration(color: Colors.black)
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(0),
                                    ),
                                    side:
                                    BorderSide(color: Colors.black)),
                                child: Container(
//                                  decoration: BoxDecoration(
//                                    borderRadius: BorderRadius.circular(100)
//                                  ),
                                  height: MediaQuery.of(context).size.height * 0.39,
                                  width: MediaQuery.of(context).size.width * 0.55,
                                  alignment: Alignment.center,
                                  child: Image(
                                      image: NetworkImage(
                                          document['imageUrl'] ?? '')),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      document['name'] ?? '',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      document['details'] ?? '',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      document['price'] ?? '',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.015,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ),
                    );
                  }).toList()),
            );
        }
    );
//      ListView.builder(
//      scrollDirection: Axis.vertical,
//      itemCount: number,
//      itemBuilder: (BuildContext context, int index) {
//        return Padding(
//          padding: const EdgeInsets.only(bottom: 20),
//          child: Container(
//            decoration: BoxDecoration(
//                color: Colors.grey,
//                borderRadius: BorderRadius.circular(15)
//            ),
//            width: 50,
//            height: 100,
//            //child: SizedBox(width: 20,),
//          ),
//        );
//      },
//    );
  }
  Widget _buildDefuListView(var mode){
    final size=MediaQuery.of(context).size;
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Best Selling",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white
              ),
            ),
            SizedBox(width: size.width*.3,),
//            ElevatedButton(
//              style: ElevatedButton.styleFrom(
//                primary: Colors.white
//              ),
//                onPressed: (){
//
//                }, child: Text("See all",
//                style: TextStyle(
//                    fontWeight: FontWeight.bold,
//                    fontSize: 20,
//                    color: Colors.white
//                ),
//            )
//            )
            TextButton(
                onPressed: (){

                },
                child: Text("See all",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                )
            ),
          ],
        ),
        StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('product').document(mode).collection(mode).snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text('Loading...',style: TextStyle(color: Colors.white),),
                  ],
                ));
              } else
                return SingleChildScrollView(
                  child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                    //physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: snapshot.data!.documents.map((document){
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFff9f36)
                          ),
                          onPressed:(){

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details(
                                        mode,
                                        document['name'] ?? '',
                                        document['details'] ?? '',
                                        document['price'] ?? '',
                                        document['imageUrl'] ?? '',
                                        document['Product_Id'] ?? ''
                                    )));

                          },
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //NetworkImage(),
                                Card(
                                  elevation: 20,
                                  color: Colors.white,
                                  //BoxDecoration(color: Colors.black)
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      side:
                                      BorderSide(color: Colors.black)),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.35,
                                    width: MediaQuery.of(context).size.width * 0.45,
                                    child: Image(
                                        image: NetworkImage(
                                            document['imageUrl'] ?? '')),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        document['name'] ?? '',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        document['details'] ?? '',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        document['price'] ?? '',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(height: MediaQuery.of(context).size.height * 0.015,)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList()),
                );
            }
        ),
      ],
    );
  }
  Widget _buildcondition(String mode){
    if(mode=='women'){
      return _buildListView(mode);
    }
    else if(mode=='men'){
      return _buildListView(mode);
    }
    else if(mode=='Device'){
      return _buildListView(mode);
    }
    else if(mode=='Kids'){
      return _buildListView(mode);
    }
    else if(mode=='electronics'){
      return _buildListView(mode);
    }
    else{
      return _buildBestSell();
        //_buildListView('women');
    }
  }
  Widget _buildBestSell(){
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text("Best Selling",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20),),
              Expanded(child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Best Selling",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20),),
                ],
              ))
            ],
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex:1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage("images/p1.PNG",),
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: MediaQuery.of(context).size.width * 0.45,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text("XYZ earphone",style: TextStyle(color: Colors.white,fontSize: 20),),
                        Text("XION",style: TextStyle(color: Colors.white,fontSize: 10),),
                        Text("\$35",style: TextStyle(color: Colors.white,fontSize: 15),),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      flex:1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: AssetImage("images/p2.PNG",),
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height * 0.35,
                              width: MediaQuery.of(context).size.width * 0.45,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text("XYZ earphone",style: TextStyle(color: Colors.white,fontSize: 20),),
                          Text("XION",style: TextStyle(color: Colors.white,fontSize: 10),),
                          Text("\$35",style: TextStyle(color: Colors.white,fontSize: 15),),
                        ],
                      ),


//                  Text("Best Selling",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20),),
//                  Expanded(child: Row(
//                    crossAxisAlignment: CrossAxisAlignment.end,
//                    mainAxisAlignment: MainAxisAlignment.end,
//                    children: [
//                      Text("Best Selling",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20),),
//                    ],
                  )
                ],
              )
          )
        ],
      ),
    );
  }

}
