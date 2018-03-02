import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:firebase/firebase.dart';

import 'todo_list_service.dart';

@Component(
  selector: 'todo-list',
  styleUrls: const ['todo_list_component.css'],
  templateUrl: 'todo_list_component.html',
  directives: const [
    CORE_DIRECTIVES,
    materialDirectives,
  ],
  providers: const [TodoListService],
)
class TodoListComponent implements OnInit {
  final tabs = ['top', 'new', 'show', 'ask', 'jobs'];
  List<int> items = [];
  DatabaseReference ref;
  Map<int, dynamic> stories = {};

  @override
  Future<Null> ngOnInit() async {
    initializeApp(databaseURL: 'https://hacker-news.firebaseio.com');
    this.ref = database().ref('/v0');
    this.ref.child('topstories').once('value').then((queryEvent) {
      this.items = queryEvent.snapshot.val().sublist(0, 1);
      this.items.forEach((item) {
        this.ref.child('item/$item').once('value').then((queryEvent) {
          this.stories[item] = queryEvent.snapshot.val();
        });
      });
    });
  }
}
