import 'package:customappbar/customappbar.dart';
import 'package:flipper/generated/l10n.dart';
import 'package:flipper/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flipper/locator.dart';

class AllItemScreen extends StatefulWidget {
  AllItemScreen({Key key}) : super(key: key);

  @override
  _AllItemScreenState createState() => _AllItemScreenState();
}

class _AllItemScreenState extends State<AllItemScreen> {
  final NavigationService _navigationService = locator<NavigationService>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          onPop: () {
            Routing.navigator.pop();
          },
          title: 'Items',
          showActionButton: false,
          onPressedCallback: () async {},
          actionButtonName: 'Save',
          icon: Icons.close,
          multi: 1,
          bottomSpacer: 48,
        ),
        body: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _navigationService.navigateTo(Routing.viewItemsScreen);
              },
              child: ListTile(
                title: Text('All Items', style: TextStyle(color: Colors.black)),
                trailing: Wrap(
                  children: <Widget>[Icon(Icons.arrow_forward_ios)],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: ListTile(
                title:
                    Text('Categories', style: TextStyle(color: Colors.black)),
                trailing: Wrap(
                  children: <Widget>[Icon(Icons.arrow_forward_ios)],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: ListTile(
                title: Text('Units', style: TextStyle(color: Colors.black)),
                trailing: Wrap(
                  children: <Widget>[Icon(Icons.arrow_forward_ios)],
                ),
              ),
            )
          ],
        ));
  }
}
