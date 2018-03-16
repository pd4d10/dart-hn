import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'hn_service.dart';
import 'pipe.dart';

@Component(
  selector: 'item-component',
  templateUrl: 'item_component.html',
  styleUrls: const ['item_component.css'],
  providers: const [HNService],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
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
    item = await this._service.fetchItem(_id);
  }
}
