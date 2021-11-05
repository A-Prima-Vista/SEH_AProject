import 'package:flutter/material.dart';

class HistoryScan extends StatelessWidget {
  const HistoryScan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Scan'),
      ),
      body: ListView.builder(
        itemBuilder: (c, i) {
          return ListTile(
            leading: Image.network(
              'https://cdn1-production-images-kly.akamaized.net/WBQ8jNDF8WjYqUNNvfHVj68XSd4=/640x480/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/1838582/original/083120500_1516419970-IMG_65743626.jpg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text('Senin, 20 April 2021'),
            subtitle: Text('Kotak amal masjid Al Falah'),
            trailing: Icon(Icons.location_on),
          );
        },
        itemCount: 15,
      ),
    );
  }
}
