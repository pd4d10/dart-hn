import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'hn_service.dart';
import 'pipe.dart';
import 'comment_component.dart';

@Component(
  selector: 'item-component',
  templateUrl: 'item_component.html',
  styleUrls: const ['item_component.css'],
  providers: const [HNService],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, CommentComponent],
  pipes: const [DomainPipe, UserLinkPipe],
)
class ItemComponent implements OnInit {
  final HNService _service;
  final RouteParams _routeParams;
  Map<String, dynamic> item;

  ItemComponent(this._service, this._routeParams);

  @override
  ngOnInit() async {
    var _id = int.parse(this._routeParams.get('id'));
    item = await fetchItems(_id);
  }

  // get items => itemsCache;

  fetchItems(int id) async {
    // print(id);
    var _item = await this._service.fetchItem(id);

    if (_item['kids'] != null) {
      var kids = _item['kids'] as List<int>;
      if (kids != null) {
        kids.forEach((kid) {
          fetchItems(kid);
        });
      }
    }

    return _item;
  }
}
