import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'view/home/view/home_view.dart';
import 'view/model/note_model.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  runApp(
    MultiProvider(
      providers: ApplicationProvider.instance!.dependItems,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      home: HomeView(),
    );
  }
}
