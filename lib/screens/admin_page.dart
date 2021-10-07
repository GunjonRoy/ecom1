import '../objects/products/device.dart';
import '../objects/products/electronics.dart';
import '../objects/products/kids.dart';
import '../objects/products/man.dart';
import '../objects/products/woman.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final _formKey = GlobalKey<FormState>();
  File? imageFile;
  final TextEditingController _cntProductName = TextEditingController();
  final TextEditingController _cntProductPrice = TextEditingController();
  final TextEditingController _cntProductDetails = TextEditingController();

  String? category;
  String? productchose;
  List productitem = [
    "Women",
    "Men",
    "Devices",
    "Kids",
    "electronics",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff9900),
        title: Text("Admin"),
      ),
      body: Container(
          color: Color(0xffff9900),
          height: size.height,
          width: size.width,
          alignment: Alignment.center,
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildMenubar(),
                      _buildImagePicker(),
                      _buildProductName(),
                      _buildProductPrice(),
                      _buildProductDetails(),
                      _buildSubmitButton(),
                    ],
                  ),
                ),
              ))

          // Column(
          //   children: [
          //     TextField(
          //       decoration: InputDecoration(
          //         border: OutlineInputBorder(),
          //       ),
          //     ),
          //   ],
          // ),

          ),
    );
  }

  Widget _buildProductName() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        controller: _cntProductName,
        maxLines: 1,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            filled: true,
            labelText: "Product Name"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter product name";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildProductPrice() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: TextFormField(
        controller: _cntProductPrice,
        maxLines: 1,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          filled: true,
          labelText: "Product Price",
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter product price";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildProductDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: TextFormField(
        controller: _cntProductDetails,
        maxLines: 3,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            filled: true,
            labelText: "Product Details"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter product details";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildImagePicker() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flexible(
                child: imageFile != null
                    ? Image.file(
                        imageFile!,
                        height: 160,
                        width: 160,
                        fit: BoxFit.cover,
                      )
                    : Text("No Image")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromRadius(30),
                      shape: CircleBorder(),
                      primary: Colors.white10),
                  onPressed: () {
                    _getImageFromCamera();
                  },
                  child: Icon(Icons.camera_alt),
                ),
                ElevatedButton(
                  onPressed: () {
                    _getImageFromGallery();
                  },
                  child: Icon(
                    Icons.image,
                    size: 30,
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromRadius(30),
                    shape: CircleBorder(),
                    primary: Colors.white10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
      //imageQuality: ,
    );
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        print("No Image Selected");
      }
    });
  }

  _getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        print("no Image on camera");
      }
    });
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.white30),
        onPressed: () {
          print(">>>>>>>>>>>>>>>>>>>>>>>" + imageFile.toString());
          if (category == "Women") {
            print("women");
            Woman(imageFile, _cntProductName.text, _cntProductPrice.text,
                    _cntProductDetails.text)
                .update();
          } else if (category == "Men") {
            print("men");
            Man(imageFile, _cntProductName.text, _cntProductPrice.text,
                    _cntProductDetails.text)
                .update();
          } else if (category == "Devices") {
            print("Device");
            Device(imageFile, _cntProductName.text, _cntProductPrice.text,
                    _cntProductDetails.text)
                .update();
          } else if (category == "Kids") {
            print("Kids");
            Kids(imageFile, _cntProductName.text, _cntProductPrice.text,
                    _cntProductDetails.text)
                .update();
          } else if (category == "electronics") {
            print("electronics");
            Electronics(imageFile, _cntProductName.text, _cntProductPrice.text,
                    _cntProductDetails.text)
                .update();
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return new AlertDialog(
                    //shape: CircleBorder(),

                    title: new Text("Please Select a Category"),
                  );
                });
          }
          // Man(imageFile, _cntProductName.text, _cntProductPrice.text, _cntProductDetails.text).update();
        },
        child: Text("Submit"));
  }

  Widget _buildMenubar() {
    return Center(
      child: DropdownButton(
        iconEnabledColor: Colors.white,
        //style: TextStyle(decorationColor: Colors.white),
        dropdownColor: Color(0xFFe37c22),
        hint: Text(
          "Select a Category",
          style: TextStyle(color: Colors.white),
        ),
        value: productchose,
        onChanged: (newValue) {
          setState(() {
            productchose = newValue.toString();
          });
        },
        items: productitem.map((valueitem) {
          if (productchose == 'Women') {
            category = 'Women';
          } else if (productchose == 'Men') {
            category = 'Men';
          } else if (productchose == 'Devices') {
            category = 'Devices';
          } else if (productchose == 'Kids') {
            category = 'Kids';
          } else if (productchose == 'electronics') {
            category = 'electronics';
          }
          print(category);
          return DropdownMenuItem(
              value: valueitem,
              child: Text(
                valueitem,
                style: TextStyle(color: Colors.white),
              ));
        }).toList(),
      ),
    );
  }
}
