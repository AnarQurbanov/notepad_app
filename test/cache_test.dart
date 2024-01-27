import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';

void main() {
  setUp(() {
    Hive.init("Database"); //database klasoru olusturup oraya kaydedecek
  });
  test('Name Box Create and Put', () async {
    final box = await Hive.openBox<String>('box1');

    await box.add("Anar");

    expect(box.values.first, 'Anar'); //ilk veri Anar mi
  });

  test('Name Box Create and Put', () async {
    final box = await Hive.openBox<String>('box1');
    List<String> items = List.generate(100, (index) => 'box : $index');
    await box.addAll(items);

    expect(box.values.first, 'box : 0');
  });

  test('Name Box Create and Put', () async {
    final box = await Hive.openBox<String>('box1');
    List<MapEntry<String, String>> items =
        List.generate(100, (index) => MapEntry("$index", "box $index"));
    await box.putAll(Map.fromEntries(items));

    expect(box.get("15"), "box 15");
  });
}
