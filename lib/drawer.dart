import 'package:flutter/material.dart';
import 'package:go444flutter/marker.dart';

class DrawerList extends StatelessWidget {
  late Set<MarkerItem> markerItems;
  late Function clickCallback;

  DrawerList({super.key});
  void setupContent(Set<MarkerItem> items) {
    markerItems = items;
  }

  void setCallback(Function callback) {
    clickCallback = callback;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> cList = [];
    bool Fake = false;
    for (var element in markerItems) {
      cList.add(ListTile(
        leading: Image(
          image: AssetImage(element.Icon),
          fit: BoxFit.scaleDown,
        ),
        title: Text(Fake ? "(已遮挡)" : element.Name),
        subtitle: Text(Fake ? "(已遮挡)" : "${element.Place},${element.Tele}"),
        onTap: () {
          clickCallback(element.latitude, element.longtitude);
          Navigator.of(context).pop();
        },
      ));
    }

    return Drawer(
        elevation: 16.0,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                const Column(children: [
                  ListTile(
                    leading: Icon(Icons.contacts),
                    title: Text('花名册'),
                  ),
                  Divider()
                ]),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    children: cList,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
