import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
        ),
        body: Consumer<DarkThemeProvider>(
          builder: (context, provider, child) => ListTile(
            leading: const Icon(Icons.dark_mode),
            title: Text(
              'Dark Theme',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: Transform.scale(
              scale: 0.7,
              child: Switch(
                value: provider.isDark,
                onChanged: (value) => provider.changeThemeToDarkAndLight(),
              ),
            ),
          ),
        ));
  }
}
