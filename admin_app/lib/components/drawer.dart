import 'package:amaljariah/controller/ui_controller/drawerController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DrawerMenu extends GetView<CustomDrawerController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/donasi.jpeg'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 8,
          ),
        ]..addAll(controller.menuItem.entries
            .map(
              (e) => Obx(() => Container(
                    color: controller.activeMewnu() == e.key
                        ? Colors.grey[400]
                        : Colors.white,
                    child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: ListTile(
                          title: Text(
                            e.key,
                          ),
                          leading: e.value,
                          onTap: () => controller.setActiveMenu(e.key),
                        )),
                  )),
            )
            .toList()),
      ),
    );
  }
}
