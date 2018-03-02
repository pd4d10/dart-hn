import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/list_component.dart';
import 'src/not_found_component.dart';
import 'src/user_component.dart';

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [ROUTER_DIRECTIVES, CORE_DIRECTIVES],
)
@RouteConfig(const [
  const Route(
    path: '/',
    name: 'Top',
    component: ListComponent,
  ),
  const Route(
    path: '/top/:page',
    name: 'Top',
    component: ListComponent,
  ),
  const Route(path: '/new/:page', name: 'New', component: ListComponent),
  const Route(path: '/show/:page', name: 'Show', component: ListComponent),
  const Route(path: '/ask/:page', name: 'Ask', component: ListComponent),
  const Route(path: '/jobs/:page', name: 'Jobs', component: ListComponent),
  const Route(path: '/user/:id', name: 'User', component: UserComponent),
  const Route(path: '/**', name: 'NotFound', component: NotFoundComponent)
])
class AppComponent {
  final tabs = ['Top', 'New', 'Show', 'Ask', 'Jobs'];
}
