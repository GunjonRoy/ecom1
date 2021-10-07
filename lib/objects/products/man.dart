import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:ecommercedemo/interfaces/product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Man implements Product {
  auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  Firestore firestore = Firestore.instance;
  @override
  String? productDetails;

  @override
  String? productName;

  @override
  String? productPrice;

  @override
  var productImage;

  //String? url;
  addImage() async{

    try{
      var storageImage = FirebaseStorage.instance.ref().child("productImage"+DateTime.now().toString());
      var task = storageImage.putFile(productImage);
      String imgurl = await (await task.onComplete).ref.getDownloadURL();
      await (imgurl);
//      FirebaseStorage storage = FirebaseStorage.instance;
//      String? url;
//      Reference ref = storage.ref().child("image1" + DateTime.now().toString());
//      UploadTask uploadTask = ref.putFile(productImage);
//      await uploadTask.whenComplete(()async{
//        url =await ref.getDownloadURL().toString();
//       // String u=await ref.getDownloadURL().toString();
//      }).catchError((onError) {
//        print(onError);
//      });
      return imgurl;

    }catch(e){
      print(e);
    }

//    FirebaseStorage storage = FirebaseStorage.instance;
//    Reference ref =await storage.ref().child("image1" + DateTime.now().toString());
//    UploadTask uploadTask = ref.putFile(productImage);
//    String u=await ref.getDownloadURL().toString();
//    print(u.toString());
//    String? urlString;// = await (await uploadTask.whenComplete).ref.getDownloadURL().toString();
//    await uploadTask.whenComplete(()async{
//      urlString = await ref.getDownloadURL().toString();
//      print(urlString.toString()+"............................");
//    }).catchError((onError) {
//      print(onError);
//    });
//    return urlString;
  }

  var url;
  @override
  Future update() async {
    //var url= addImage();
    var storageImage = FirebaseStorage.instance.ref().child("productImage"+DateTime.now().toString());
    var task = storageImage.putFile(productImage);
    String imgurl = await (await task.onComplete).ref.getDownloadURL();
    await (imgurl);
//    print(
//        ">...........................................,,,,,,,,,,,,,,,,,,,,>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
//    print(url);

//    var storageImage=await FirebaseStorage.instance.ref().child(productImage.path).putFile(productImage).;
//    //var task=storageImage.putFile(productImage);
    print(imgurl);
    await firestore
        .collection('product')
        .document('men')
        .collection('men')
        .document()
        .setData({
      'imageUrl': imgurl,
      'name': productName.toString(),
      'price': productPrice.toString(),
      'details': productDetails.toString()
    });
    //return urlString.toString();

  }

  Man(var _productImage, String productName, String productPrice,
      String productDetails) {
    this.productImage = _productImage;
    this.productName = productName;
    this.productPrice = productPrice;
    this.productDetails = productDetails;

    // TODO: implement setter
    //throw UnimplementedError();
  }

//  setProducts(_productImage, String productName, String productPrice, String ProductDetails) {
//    // TODO: implement setProducts
//    throw UnimplementedError();
//  }

}
