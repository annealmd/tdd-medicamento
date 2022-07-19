import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              title: const Text('Importante'),
              backgroundColor: Colors.lightGreen[700],
              automaticallyImplyLeading: false, // not show back arrow
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Tutorial'),
              onTap: () {
                // Navigator.of(context).pushNamed(Tutorial.routeName);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.access_alarms),
              title: const Text('Notificações'),
              onTap: () {
                //  Navigator.of(context).pushNamed(Alarmes.routeName);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.mood),
              title: const Text('SobreMim'),
              onTap: () {
                // Navigator.of(context).pushNamed(AboutMe.routeName);
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
