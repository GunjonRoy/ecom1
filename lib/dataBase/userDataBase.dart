import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseProductService {
  String? uid;
  DataBaseProductService({this.uid});

  final CollectionReference user = Firestore.instance.collection('E-Commerce');

  Future UpdateUserData(String _product_Name, _product_price, _category,var _product_img,var quantity) async {
    return await user.document(uid).collection('product').add({
      'imageUrl':_product_img,
      'Product_Name': _product_Name,
      'Product_Price': _product_price,
      'Product_Category': _category,
      'count': quantity
    });
  }
}