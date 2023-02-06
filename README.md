Truncates a HTML string to a maximum length and optionally adds an ellipsis while preserving the HTML structure.

## Usage

```dart
String truncatedHtml = htmlEllsipsis('<div>Some <strong>cool</strong> example HTML</div>', 9);
// <div>Some <strong>cool</strong></div>
```

You can also optionally add the ellipsis character.

```dart
String truncatedHtml = htmlEllsipsis('<div>Some cool example HTML</div>', 9, addEllipsis: true);
// <div>Some cool&hellip;</div>
```

## Additional information

This package is a Dart port of the awesome [TypeScript library](https://github.com/alexghr/html-ellipsis) made by [alexghr](https://github.com/alexghr).