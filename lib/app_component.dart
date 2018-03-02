import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
// import 'package:angular_components/angular_components.dart';

import 'src/list_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [ROUTER_DIRECTIVES, CORE_DIRECTIVES],
  providers: const [ROUTER_PROVIDERS],
  // directives: const [materialDirectives],
  // providers: const [materialProviders],
)
@RouteConfig(const [
  const Route(path: '/top', name: 'Top', component: ListComponent),
  const Route(path: '/new', name: 'New', component: ListComponent),
  const Route(path: '/show', name: 'Show', component: ListComponent),
  const Route(path: '/ask', name: 'Ask', component: ListComponent),
  const Route(path: '/jobs', name: 'Jobs', component: ListComponent),
])
class AppComponent {
  final tabs = ['Top', 'New', 'Show', 'Ask', 'Jobs'];
}
