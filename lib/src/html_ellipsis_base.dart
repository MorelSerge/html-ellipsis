import 'package:html_ellipsis/src/util.dart';

/// Truncates [html] to [maxLength] chars without destroying HTML tags.
/// Setting [addEllipsis] to `true` will append an ellipsis to the end of the string (this does not make the string longer than [maxLength]).
///
/// Based on https://github.com/alexghr/html-ellipsis/blob/main/src/lib/html-ellipsis.ts
String htmlEllipsis(String html, int maxLength, {bool addEllipsis = false}) {
  int len = html.length;
  if (len <= maxLength) return html;

  // Leave room for ellipsis
  if (addEllipsis) {
    --maxLength;
  }

  int i = 0;
  int charCount = 0;
  List<String> tagStack = [];

  while (i < len && charCount < maxLength) {
    String char = html[i];
    num charCode = html.codeUnitAt(i);

    if (char == '<') {
      String tag = extractTag(html, i);

      // Skip content between `<` and `>`
      i += tag.length;

      if (isEndTag(tag)) {
        tagStack.removeLast();
      } else {
        String tagName = extractTagName(tag);

        if (!isVoidTag(tagName)) {
          tagStack.add(tagName);
        }
      }
    } else {
      // If `charCode` is a high surrogate
      // and if the string contains a low surrogate
      // then count the pair as a single character
      if (charCode >= 0xD800 && charCode <= 0xDBFF && i + 1 < len) {
        ++i;
      }

      ++charCount;
      ++i;
    }
  }

  String result = html.substring(0, i);

  if (addEllipsis && result.length < html.length) {
    result += '&hellip;';
  }

  // If we bailed inside the contents of a non-void tag,
  // we need to add the closing tag again.
  for (int j = tagStack.length - 1; j >= 0; --j) {
    result += '</${tagStack[j]}>';
  }

  return result;
}
