import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class ReviewBottom extends StatefulWidget {
  ScrollController? scrollController;
  double? bottomSheetOffset;
  String? productId;
  String? productName;
  String? productDetail;
  bool? review;
  ReviewBottom({
    required this.scrollController,
    required this.bottomSheetOffset,
    required this.productId,
    required this.productName,
    required this.productDetail,
    required this.review,
  });
  @override
  _ReviewBottomState createState() => _ReviewBottomState(
      scrollController: scrollController,
      bottomSheetOffset: bottomSheetOffset,
    productId: productId,
    productName: productName,
    productDetail: productDetail,
    review: review
  );
}

class _ReviewBottomState extends State<ReviewBottom> {
  ScrollController? scrollController;
  double? bottomSheetOffset;
  String? productId;
  String? productName;
  String? productDetail;
  bool? review;
  _ReviewBottomState({
    required this.scrollController,
    required this.bottomSheetOffset,
    required this.productId,
    required this.productName,
    required this.productDetail,
    required this.review,
  });

  bool visibilityTag = false;
  bool visibilityObs = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "tag"){
        visibilityTag = visibility;
      }
      if (field == "obs"){
        visibilityObs = visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(backgroundColor: Color(0xFFff9f36)),
        body:Container(
          //height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFff9f36),
          child: ListView(
            padding: EdgeInsets.zero,
            controller: scrollController,
            children: <Widget>[
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
                    visibilityObs ? null : _changed(true, "obs");
                  },
                  child: Text(
                    "Write Your..",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
              ),

              Container(
                  //margin: new EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      visibilityObs ? Column(
                        children: [
                          Container(
                            //margin: EdgeInsets.all(60.0),
                            child: RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 30,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            //child: FlutterLogo(size: 150.0,),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                flex: 11,
                                child: new TextField(
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  decoration: new InputDecoration(
                                   // border: Border.,
                                      labelText: "Tell us your experience",
                                      isDense: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                        //borderRadius: BorderRadius.circular(25.7),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                        //borderRadius: BorderRadius.circular(25.7),
                                      )
                                  ),

                                ),
                              ),
                              new Expanded(
                                flex: 1,
                                child: new IconButton(
                                  color: Colors.grey[400],
                                  icon: const Icon(Icons.cancel, size: 22.0,),
                                  onPressed: () {
                                    _changed(false, "obs");
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            color: Colors.white,
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 230,top: 20,right: 8),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height*.5,
                                width: MediaQuery.of(context).size.width*.6,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:Color(0xFFff9f36)
                                  ),
                                    onPressed: (){
                                      visibilityObs ? null : _changed(true, "obs");
                                    },
                                    child: Text("SEND")
                                ),
                              ),
                            ),
                          )
                        ],
                      ) : new Container(),

                      visibilityTag ? new Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          new Expanded(
                            flex: 11,
                            child: new TextField(
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: new InputDecoration(
                                  labelText: "Tags",
                                  isDense: true
                              ),
                            ),
                          ),
                          new Expanded(
                            flex: 1,
                            child: new IconButton(
                              color: Colors.grey[400],
                              icon: const Icon(Icons.cancel, size: 22.0,),
                              onPressed: () {
                                _changed(false, "tag");
                              },
                            ),
                          ),
                        ],
                      ) : new Container(),
                    ],
                  )
              ),
              Container(
                color: Colors.white,
                height: 300,
                width: MediaQuery.of(context).size.width,
              )

            ],
          ),
        )
    );
  }
}
