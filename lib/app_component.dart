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
  providers: const [ROUTER_PROVIDERS],
)
@RouteConfig(const [
  const Route(
      path: '/top', name: 'Top', component: ListComponent, useAsDefault: true),
  const Route(path: '/top/:page', name: 'Top', component: ListComponent),
  const Route(path: '/new', name: 'New', component: ListComponent),
  const Route(path: '/show', name: 'Show', component: ListComponent),
  const Route(path: '/ask', name: 'Ask', component: ListComponent),
  const Route(path: '/jobs', name: 'Jobs', component: ListComponent),
  const Route(path: '/user/:id', name: 'User', component: UserComponent),
  const Route(path: '/**', name: 'NotFound', component: NotFoundComponent)
])
class AppComponent {
  final tabs = ['Top', 'New', 'Show', 'Ask', 'Jobs'];
}
