import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:dart_hn/app_component.dart';
import 'package:pwa/client.dart' as pwa;

void main() {
  bootstrap(AppComponent, [
    new Provider(pwa.Client, useValue: new pwa.Client()),
    ROUTER_PROVIDERS,
    // Remove next line in production
    // provide(LocationStrategy, useClass: HashLocationStrategy),
  ]);
}
