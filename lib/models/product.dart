
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String name;
  String category;
  double price;
  String image;
  Timestamp createdAt;
  
  Product.fromMap(Map<String,dynamic> data){
    id = data['id'];
    name = data['name'];
    category = data['category'];
    price = data['price'];
    image = data['image'];
    createdAt = data['createdAt'];
  }
}