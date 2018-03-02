import 'dart:async';
import 'dart:math';

import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart';
import 'package:angular_router/angular_router.dart';

import 'list_service.dart';

DatabaseReference ref;

@Component(
  selector: 'list',
  styleUrls: const ['list_component.css'],
  templateUrl: 'list_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
  providers: const [TodoListService],
)
class ListComponent implements OnInit {
  List<int> items = [];
  int page;
  int total = 0; // TODO: Fix blink

  Map<int, dynamic> stories = {};
  final RouteParams _routeParams;
  final PAGE_SIZE = 30;

  ListComponent(this._routeParams) {
    var _page = _routeParams.get('page') ?? '1';
    this.page = int.parse(_page, onError: (_) => null) ?? 1;
  }

  get start => (page - 1) * PAGE_SIZE;
  get count => (total / PAGE_SIZE).ceil();

  get _hasPrev => page >= 2;
  get _hasNext => page <= count;
  get prevLink => getLink(page - 1, _hasPrev);
  get nextLink => getLink(page + 1, _hasNext);
  get prevClass => getClass(page - 1 >= 1);
  get nextClass => getClass(page + 1 <= count);

  getLink(int _page, bool _valid) {
    if (_valid) {
      return [
        'Top',
        {'page': _page.toString()},
      ];
    } else {
      return null;
    }
  }

  getClass(bool _valid) {
    return _valid ? '' : 'disabled';
  }

  @override
  Future<Null> ngOnInit() async {
    if (ref == null) {
      initializeApp(databaseURL: 'https://hacker-news.firebaseio.com');
      ref = database().ref('/v0');
    }
    ref.child('topstories').once('value').then((queryEvent) {
      var _items = queryEvent.snapshot.val() as List;
      total = _items.length;
      items = _items.sublist(start, min(start + PAGE_SIZE, total));
      items.forEach((item) {
        if (this.stories[item] == null) {
          ref.child('item/$item').once('value').then((queryEvent) {
            this.stories[item] = queryEvent.snapshot.val();
          });
        }
      });
    });
  }
}
