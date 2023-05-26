import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final tableUsers = FirebaseFirestore.instance.collection('users');
  final tableNotifications =
      FirebaseFirestore.instance.collection('notifications');
}
