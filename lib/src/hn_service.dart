import 'dart:async';

import 'package:angular/core.dart';
import 'package:firebase/firebase.dart';

import 'utils.dart';

DatabaseReference _ref;
Map<int, dynamic> itemsCache = {};
Map<String, dynamic> usersCache = {};

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class HNService {
  HNService() {
    if (_ref == null) {
      initializeApp(databaseURL: 'https://hacker-news.firebaseio.com');
      _ref = database().ref('/v0');
    }
  }

  Future<List<int>> fetchList(String tag) async {
    var _query = await _ref.child(DB_MAP[tag]).once('value');
    return _query.snapshot.val();
  }

  Future<Map<String, dynamic>> fetchItem(int id) async {
    if (itemsCache[id] == null) {
      var _query = await _ref.child('item/$id').once('value');
      itemsCache[id] = _query.snapshot.val();
    }
    return itemsCache[id];
  }

  Future<Map<String, dynamic>> fetchUser(String id) async {
    if (usersCache[id] == null) {
      var _query = await _ref.child('user/$id').once('value');
      usersCache[id] = _query.snapshot.val();
    }
    return usersCache[id];
  }
}
