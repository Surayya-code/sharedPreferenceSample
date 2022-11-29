import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme.dart';

void main() => runApp(
  ChangeNotifierProvider<ThemeColorData>(
  create: (BuildContext context)=>ThemeColorData(),
child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeColorData>(context).themeColor,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('Change Theme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             SwitchListTile(
              title:Provider.of<ThemeColorData>(context).isGreen ? const Text("Green Theme") 
              : const Text("Red Theme"),
              onChanged: (bool newValue){
               Provider.of<ThemeColorData>(context,listen: false).toggleTheme();
              },
              value:  Provider.of<ThemeColorData>(context).isGreen,
            ),
            const Card(
              child: ListTile(
                title: Text("To Do"),
                trailing: Icon(Icons.check_box),
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              child: const Text("Add"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
