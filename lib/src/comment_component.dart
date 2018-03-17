import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'hn_service.dart';
import 'pipe.dart';

@Component(
  selector: 'comment-component',
  templateUrl: 'comment_component.html',
  styleUrls: const ['comment_component.css'],
  providers: const [HNService],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
  pipes: const [DomainPipe, UserLinkPipe, TimeAgoPipe],
)
class CommentComponent implements OnInit {
  @Input('id')
  int id;

  get item => itemsCache[id];

  @override
  ngOnInit() {
    // TODO: implement ngOnInit
    return null;
  }
}
