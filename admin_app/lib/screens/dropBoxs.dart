import 'package:amaljariah/components/drawer.dart';
import 'package:amaljariah/controller/controller/dropBoxController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DropBox extends GetView<DropBoxController> {
  @override
  Widget build(BuildContext context) {
    return controller.isLoading()
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: EdgeInsets.all(16.0),
            child: ListView.builder(
                itemCount: controller.dropBoxResults.length,
                itemBuilder: (ctx, i) {
                  var _item = controller.dropBoxResults[i];
                  return Card(
                    child: ListTile(
                      title: Text(_item['from']),
                      leading: Icon(Icons.person),
                      subtitle: Text("${_item['currency']} ${_item['total']}"),
                      trailing: Icon(Icons.location_pin),
                    ),
                  );
                }),
          );
  }
}
