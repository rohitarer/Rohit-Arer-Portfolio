import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rohit_arer_portfolio/models/portfolio_item.dart';
import 'package:rohit_arer_portfolio/models/user_profile.dart';
import 'package:rohit_arer_portfolio/constants/firebase_paths.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Singleton pattern
  FirebaseService._privateConstructor();
  static final FirebaseService instance = FirebaseService._privateConstructor();

  // Fetches the user profile data
  Future<UserProfile?> fetchUserProfile(String userId) async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection(FirebasePaths.usersCollection)
          .doc(userId)
          .get();
      if (doc.exists) {
        return UserProfile.fromFirestore(
            doc.data() as Map<String, dynamic>, doc.id);
      }
      return null;
    } catch (e) {
      print('Error fetching user profile: $e');
      return null;
    }
  }

  // Fetches all portfolio items
  Future<List<PortfolioItem>> fetchPortfolioItems() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection(FirebasePaths.projectsCollection).get();
      return snapshot.docs
          .map((doc) => PortfolioItem.fromFirestore(
              doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    } catch (e) {
      print('Error fetching portfolio items: $e');
      return [];
    }
  }

  // Uploads an image to Firebase Storage and returns the image URL
  Future<String?> uploadImage(String filePath, String destinationPath) async {
    try {
      final fileRef = _storage.ref(destinationPath);
      final uploadTask = fileRef.putFile(File(filePath));
      final snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  // Adds a new portfolio item
  Future<void> addPortfolioItem(PortfolioItem item) async {
    try {
      await _firestore
          .collection(FirebasePaths.projectsCollection)
          .add(item.toFirestore());
    } catch (e) {
      print('Error adding portfolio item: $e');
    }
  }

  // Updates an existing portfolio item
  Future<void> updatePortfolioItem(PortfolioItem item) async {
    try {
      await _firestore
          .collection(FirebasePaths.projectsCollection)
          .doc(item.id)
          .update(item.toFirestore());
    } catch (e) {
      print('Error updating portfolio item: $e');
    }
  }

  // Deletes a portfolio item
  Future<void> deletePortfolioItem(String itemId) async {
    try {
      await _firestore
          .collection(FirebasePaths.projectsCollection)
          .doc(itemId)
          .delete();
    } catch (e) {
      print('Error deleting portfolio item: $e');
    }
  }
}
