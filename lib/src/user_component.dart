import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'hn_service.dart';
import 'pipe.dart';

@Component(
  selector: 'user-component',
  templateUrl: 'user_component.html',
  styleUrls: const ['user_component.css'],
  directives: const [CORE_DIRECTIVES],
  providers: const [HNService],
  pipes: const [TimeAgoPipe],
)
class UserComponent implements OnInit {
  final HNService _service;
  final RouteParams _routeParams;
  Map<String, dynamic> user;

  UserComponent(this._service, this._routeParams);
  @override
  ngOnInit() async {
    var _id = this._routeParams.get('id');
    user = await this._service.fetchUser(_id);
  }
}
