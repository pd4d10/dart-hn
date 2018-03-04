import 'package:angular/angular.dart';

@Pipe('timeAgo')
class TimeAgoPipe extends PipeTransform {
  String _ceil(double n) => n.ceil().toString();

  String _pluralize(double time, String unit) {
    if (time == 1) {
      return '${_ceil(time)} ${unit} ago';
    }
    return '${_ceil(time)} ${unit}s ago';
  }

  String transform(int time) {
    var diff = new DateTime.now().millisecondsSinceEpoch / 1000 - time;
    if (diff < 3600) {
      return _pluralize(diff / 60, 'minute');
    } else if (diff < 86400) {
      return _pluralize(diff / 3600, 'hour');
    } else {
      return _pluralize(diff / 86400, 'day');
    }
  }
}

@Pipe('commentText')
class CommentTextPipe extends PipeTransform {
  String transform(int count) {
    switch (count) {
      case 0:
        return 'discuss';
      case 1:
        return '1 comment';
      default:
        return '$count comments';
    }
  }
}
