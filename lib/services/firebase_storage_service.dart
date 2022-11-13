import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  FirebaseAuth auth = FirebaseAuth.instance;
  final storageRef = FirebaseStorage.instance.ref();
  Future<String?> getImage(String? imageName) async {
    try {
      String downloadURL =
          await storageRef.child('${auth.currentUser?.uid}').child('${imageName}.jpg').getDownloadURL();
      return downloadURL;
    } on FirebaseException catch (e) {
      // Caught an exception from Firebase.
      print("Failed with error '${e.code}': ${e.message}");
    }
  }
}
