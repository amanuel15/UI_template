import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // collection reference
  final CollectionReference productsColletion =
      Firestore.instance.collection('product');

  Future updateProductsData({
    String id,
    String name,
    String category,
    double price,
    Timestamp createdAt,
  }) async {
    return await productsColletion.document(id).setData({
      'name': name,
      'category': category,
      'price': price,
      'createdAt': createdAt,
    });
  }
}
