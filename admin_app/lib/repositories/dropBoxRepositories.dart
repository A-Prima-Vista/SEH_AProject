import 'dart:developer';

import 'package:amaljariah/model/organization.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DropBoxRepositories {
  static final String collectionName = 'lembaga';
  static FirebaseFirestore? _firestore;

  static void init() {
    _firestore = FirebaseFirestore.instance;
  }

  static Future<Organization?> getOrganization() async {
    try {
      var _organizations = await _firestore
          ?.collection(collectionName)
          .doc('dFNJmIDawpLokOcqFgZo')
          .get();
      if (_organizations?.data() != null) {
        return Organization.fromJson(_organizations!.data()!);
      } else {
        return null;
      }
    } catch (e) {
      log('Error firestor $e');
      return null;
    }
  }

  static Future<List<Map<String, dynamic>>?> getDropBox() async {
    try {
      var _dropBox = await _firestore
          ?.collection(collectionName)
          .doc('dFNJmIDawpLokOcqFgZo')
          .collection('drop-box')
          .get();
      if (_dropBox?.docs != null) {
        log(_dropBox?.docs.first.toString() ?? '');
        _dropBox?.docs.forEach((element) {
          log(element.data().toString());
        });
        return _dropBox?.docs.map((e) => e.data()).toList();
      } else {
        return null;
      }
    } catch (e) {
      log('Error firestor $e');
      return null;
    }
  }

  static Future<List<Map<String, dynamic>>?> getDropBoxResult() async {
    try {
      var _dropBox = await _firestore
          ?.collection(collectionName)
          .doc('dFNJmIDawpLokOcqFgZo')
          .collection('ziswaf-history')
          .get();
      if (_dropBox?.docs != null) {
        log(_dropBox?.docs.first.toString() ?? '');
        _dropBox?.docs.forEach((element) {
          log(element.data().toString());
        });
        return _dropBox?.docs.map((e) => e.data()).toList();
      } else {
        return null;
      }
    } catch (e) {
      log('Error firestor $e');
      return null;
    }
  }
}
