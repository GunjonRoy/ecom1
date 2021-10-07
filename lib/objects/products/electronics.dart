import 'package:ecommercedemo/interfaces/product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Electronics implements Product{
  Firestore firestore=Firestore.instance;

  @override
  String? productDetails;

  @override
  var productImage;

  @override
  String? productName;

  @override
  String? productPrice;

  @override
  Future update()async {
    var storageImage = FirebaseStorage.instance.ref().child("productImage"+DateTime.now().toString());
    var task = storageImage.putFile(productImage);
    String imgurl = await (await task.onComplete).ref.getDownloadURL();
    await (imgurl);
    print(imgurl);
    await firestore
        .collection('product')
        .document('electronics')
        .collection('electronics')
        .document()
        .setData({
      'imageUrl': imgurl,
      'name': productName.toString(),
      'price': productPrice.toString(),
      'details': productDetails.toString()
    });
    // TODO: implement update
    //throw UnimplementedError();
  }

  Electronics(var productImage,String productName,String productPrice,productDetails){
    this.productImage=productImage;
    this.productName=productName;
    this.productPrice=productPrice;
    this.productDetails=productDetails;
  }

}