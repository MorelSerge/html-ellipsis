String extractTag(String html, int startIndex) {
  int endIndex = html.indexOf('>', startIndex);
  return html.substring(startIndex, endIndex + 1);
}

bool isEndTag(String tag) {
  return tag[1] == '/';
}

String extractTagName(String tag) {
  int tagNameEndIndex = tag.indexOf(' ');
  // Could be a `<br/>`
  if (tagNameEndIndex == -1) {
    tagNameEndIndex = tag.indexOf('/');
    if (tagNameEndIndex == -1) tagNameEndIndex = tag.length - 1;
  }
  return tag.substring(1, tagNameEndIndex);
}

/// Based on https://www.w3.org/TR/2011/WD-html-markup-20110113/syntax.html
const List<String> _voidTags = [
  'area',
  'base',
  'br',
  'col',
  'command',
  'embed',
  'hr',
  'img',
  'input',
  'keygen',
  'link',
  'meta',
  'param',
  'source',
  'track',
  'wbr',
];

bool isVoidTag(String tagName) {
  return _voidTags.any((element) => tagName == element);
}
