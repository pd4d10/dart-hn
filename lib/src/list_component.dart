import 'dart:math';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'hn_service.dart';
import 'pipe.dart';
import 'utils.dart';

@Component(
  selector: 'list',
  styleUrls: const ['list_component.css'],
  templateUrl: 'list_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
  providers: const [HNService],
  pipes: const [TimeAgoPipe, CommentTextPipe],
)
class ListComponent implements OnInit {
  List<int> items = [];
  int page;
  String tag;
  int total = 0; // TODO: Fix blink

  final Router _router;
  final RouteParams _routeParams;
  final HNService _service;
  final PAGE_SIZE = 30;

  get stories => storiesCache;

  ListComponent(this._routeParams, this._router, this._service) {
    var _tag = _routeParams.get('tag');
    if (TAGS.contains(_tag)) {
      tag = _tag;
    } else {
      this._router.navigate([
        'List',
        {'tag': ''}
      ]);
      return;
    }
    var _page = _routeParams.get('page') ?? '1';
    page = int.parse(_page, onError: (_) => null) ?? 1;
    print(_routeParams.params);
  }

  get start => (page - 1) * PAGE_SIZE;
  get count => (total / PAGE_SIZE).ceil();

  get _hasPrev => page - 1 >= 1;
  get _hasNext => page + 1 <= count;
  get prevLink => getLink(page - 1, _hasPrev);
  get nextLink => getLink(page + 1, _hasNext);
  get prevClass => getClass(_hasPrev);
  get nextClass => getClass(_hasNext);

  getLink(int _page, bool _valid) {
    if (_valid) {
      return [
        'List',
        {'tag': tag, 'page': _page.toString()},
      ];
    } else {
      return null;
    }
  }

  getClass(bool _valid) {
    return _valid ? '' : 'disabled';
  }

  getUserLink(id) => [
        'User',
        {'id': id}
      ];
  getItemLink(id) => [
        'Item',
        {'id': id}
      ];

  @override
  ngOnInit() async {
    var _items = await _service.fetchList(tag);
    total = _items.length;
    items = _items.sublist(start, min(start + PAGE_SIZE, total));
    items.forEach((id) {
      _service.fetchItem(id);
    });
  }
}
