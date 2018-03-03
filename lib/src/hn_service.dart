import 'dart:async';

import 'package:angular/core.dart';
import 'package:firebase/firebase.dart';

import 'utils.dart';

DatabaseReference ref;
Map<int, dynamic> stories = {};

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class HNService {
  HNService() {
    if (ref == null) {
      initializeApp(databaseURL: 'https://hacker-news.firebaseio.com');
      ref = database().ref('/v0');
    }
  }

  Future<List<int>> fetchList(String tag) async {
    return ref.child(DB_MAP[tag]).once('value').then((queryEvent) {
      return queryEvent.snapshot.val();
    });
  }

  Future<Map<String, dynamic>> fetchItem(int id) async {
    if (stories[id] == null) {
      return ref.child('item/$id').once('value').then((queryEvent) {
        stories[id] = queryEvent.snapshot.val();
        return stories[id];
      });
    } else {
      return stories[id];
    }
  }
}
