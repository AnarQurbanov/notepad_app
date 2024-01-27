import 'package:flutter/material.dart';
import '../../core/extension/context_extension.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      currentAccountPicture: FlutterLogo(),
      accountName: Text(
        "Notepad",
        style: TextStyle(fontSize: context.textTheme.headline5!.fontSize),
      ),
      accountEmail: Text(""),
    );
  }
}
