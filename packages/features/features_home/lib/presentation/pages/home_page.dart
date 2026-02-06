import 'package:flutter/material.dart';
import 'package:share/share.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Home Page')),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: context.secondaryButtonStyle,
                child: Text('Home Page'),
              ),
            ),
            TextField(),
          ],
        ),
      ),
    );
  }
}
