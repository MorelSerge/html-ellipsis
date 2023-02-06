import 'package:html_ellipsis/html_ellipsis.dart';

void main() {
  String input1 = '<div>Some <strong>cool</strong> example HTML</div>';
  print('Truncate: ${htmlEllipsis(input1, 9)}');
  String input2 = '<div>Some cool example HTML</div>';
  print('Truncate: ${htmlEllipsis(input2, 9, addEllipsis: true)}');
}
