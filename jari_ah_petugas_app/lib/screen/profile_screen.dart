import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Center(
              child: Image.network(
                'https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678130-profile-alt-4-512.png',
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(height: 25),
            Center(child: Text('Fulanah binti Fulan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
            SizedBox(height: 55),
            Text('Jumlah Scan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Center(child: Text('25', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55))),
          ],
        ),
      ),
    );
  }
}
