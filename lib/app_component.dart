import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/list_component.dart';
import 'src/not_found_component.dart';
import 'src/user_component.dart';
import 'src/item_component.dart';
import 'src/utils.dart';

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [ROUTER_DIRECTIVES, CORE_DIRECTIVES],
)
@RouteConfig(const [
  // const Route(
  //   path: '/',
  //   name: 'Top',
  //   component: ListComponent,
  //   data: const {'name': 'Top'},
  // ),
  const Route(
    path: '/:tag',
    name: 'List',
    component: ListComponent,
  ),
  const Route(
    path: '/user/:id',
    name: 'User',
    component: UserComponent,
  ),
  const Route(
    path: '/item/:id',
    name: 'Item',
    component: ItemComponent,
  ),
  const Route(
    path: '/**',
    name: 'NotFound',
    component: NotFoundComponent,
  )
])
class AppComponent {
  final tags = TAGS.sublist(1);
  final homeLink = [
    'List',
    {'tag': ''}
  ];
  getRouterLinks(tag) => [
        'List',
        {'tag': tag}
      ];
}
