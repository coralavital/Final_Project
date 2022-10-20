import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  late FirebaseFirestore firestore;
  late FirebaseAuth auth;

  initialize() {
    firestore = FirebaseFirestore.instance;
    auth = FirebaseAuth.instance;
  }

  Future<void> addProduct(
      String name, String image, String expired_date) async {
    try {
      await firestore
          .collection('${auth.currentUser?.uid}')
          .doc("Camera_1")
          .update(
        {
          'products': FieldValue.arrayUnion([
            {"name": name, "image": image, "expired_date": expired_date}
          ])
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<List> readProducts() async {
    QuerySnapshot querySnapshot;
    List document = [];

    try {
      querySnapshot =
          await firestore.collection('${auth.currentUser?.uid}').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          if (doc.id == "Camera_1") {
            document = doc['products'];
          }
        }
        return document;
      }
    } catch (e) {
      print(e);
    }
    return document;
  }

  Future<List> readShoppingList() async {
    QuerySnapshot querySnapshot;
    List document = [];

    try {
      querySnapshot =
          await firestore.collection('${auth.currentUser?.uid}').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          if (doc.id == "Camera_1") {
            document = doc['shopping_list'];
          }
        }
        return document;
      }
    } catch (e) {
      print(e);
    }
    return document;
  }

  Future<void> addToShoppingList(
      String name, String image, int quantity) async {
    try {
      await firestore
          .collection('${auth.currentUser?.uid}')
          .doc("Camera_1")
          .update(
        {
          'shopping_list': FieldValue.arrayUnion([
            {"name": name, "image": image, "quantity": quantity}
          ])
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> addItem(List doc, int index) async {
    doc.elementAt(index)['quantity'] += 1;
    try {
      await firestore
          .collection('${auth.currentUser?.uid}')
          .doc("Camera_1")
          .update(
        {'shopping_list': doc},
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> removeItem(List doc, int index) async {
    doc.elementAt(index)['quantity'] -= 1;
    if (doc.elementAt(index)['quantity'] > 0) {
      try {
        await firestore
            .collection('${auth.currentUser?.uid}')
            .doc("Camera_1")
            .update(
          {'shopping_list': doc},
        );
      } catch (e) {
        print(e);
      }
    } else if (doc.elementAt(index)['quantity'] <= 0) {
      doc.remove(doc.elementAt(index));
      try {
        await firestore
            .collection('${auth.currentUser?.uid}')
            .doc("Camera_1")
            .update(
          {'shopping_list': doc},
        );
      } catch (e) {
        print(e);
      }
    }
  }
}
