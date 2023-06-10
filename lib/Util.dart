String pascalToSnake(String input) {
  StringBuffer output = StringBuffer();

  for (int i = 0; i < input.length; i++) {
    String char = input[i];

    if (i > 0 && char.toUpperCase() == char) {
      output.write('_');
    }

    output.write(char.toLowerCase());
  }

  return output.toString();
}

dynamic convertTypeValuesToSnakeCase(dynamic json) {
  final deprecatedWidgetMap = {
    'flat_button': 'text_button',
    'translated_text': 'text',
  };
  if (json is Map) {
    final convertedJson = <String, dynamic>{};
    json.forEach((key, value) {
      if (key == 'type') {
        convertedJson[key] = _convertToSnakeCase(value);
        if (deprecatedWidgetMap.containsKey(convertedJson[key])) {
          convertedJson[key] = deprecatedWidgetMap[convertedJson[key]];
        }
      } else {
        if (key == 'data') {

          convertedJson.addAll({
            "args": {"text": value}
          });
          // json.remove(key);

        }
        convertedJson[key] = convertTypeValuesToSnakeCase(value);
      }
    });
    return convertedJson;
  } else if (json is List) {
    return json.map((e) => convertTypeValuesToSnakeCase(e)).toList();
  }
  return json;
}

String _convertToSnakeCase(String input) {
  return input
      .replaceAllMapped(
          RegExp(r'(?<=[a-z])[A-Z]'), (match) => '_${match.group(0)}')
      .toLowerCase();
}

