import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Singleton pattern
  StorageService._privateConstructor();
  static final StorageService instance = StorageService._privateConstructor();

  // Uploads a file to Firebase Storage and returns the download URL
  Future<String?> uploadFile(File file, String destinationPath) async {
    try {
      final fileRef = _storage.ref(destinationPath);
      final uploadTask = fileRef.putFile(file);
      final snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  // Deletes a file from Firebase Storage
  Future<void> deleteFile(String filePath) async {
    try {
      final fileRef = _storage.ref(filePath);
      await fileRef.delete();
    } catch (e) {
      print('Error deleting file: $e');
    }
  }

  // Gets the download URL for an existing file in Firebase Storage
  Future<String?> getDownloadURL(String filePath) async {
    try {
      final fileRef = _storage.ref(filePath);
      return await fileRef.getDownloadURL();
    } catch (e) {
      print('Error getting download URL: $e');
      return null;
    }
  }
}
