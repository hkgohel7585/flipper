import 'package:enexus/CategoryItemsPage.dart';
import 'package:enexus/products/product.dart';
import 'package:enexus/widgets/badge_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  void _showBottomSheetCallback() {
    _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
      return SizedBox(
        height: 410,
        child: Card(
          child: Column(
            children: [
              CupertinoButton(
                color: Colors.blue[500],
                child: Text("+"),
              ),
              Divider(),
              ListTile(
                title: Text('(408) 555-1212',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                leading: Icon(
                  Icons.contact_phone,
                  color: Colors.blue[500],
                ),
              ),
              ListTile(
                title: Text('costa@example.com'),
                leading: Icon(
                  Icons.contact_mail,
                  color: Colors.blue[500],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  //fake list of categories
  //TODO: replace this hard coded list view with real data
  final List<int> allCities = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    8,
    9,
    0,
    11,
    45,
    45,
    56,
    12,
    565,
    67
  ];
  getGridViewItems(BuildContext context) {
    List<Widget> allWidgets = new List<Widget>();

    for (int i = 0; i < allCities.length; i++) {
      var widget = Card(
        color: Colors.blue, //set a bg of a card.
        child: Center(
          child: Text(
            'Item $i',
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      );
      allWidgets.add(widget);
    }
    return allWidgets;
  }

  Widget _buildBottomSheet() {
    //it disable back button
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {},
      child: Container(
        child: Text("I am bottom"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      key: _scaffoldKey,
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryItemsPage()),
          );
        },
        child: ListView(
          children: <Widget>[
            FirstHalf(),
            //List waiting clients in your shop, or normal friends to chat with!.
            Container(
              height: 105,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: 10),
                      BadgeCircleImage(
                        image: "assets/cm5.jpeg",
                        notificationCount: 2,
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/cm2.jpeg",
                        ),
                        radius: 25,
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/cm8.jpeg",
                        ),
                        radius: 25,
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/cm5.jpeg",
                        ),
                        radius: 25,
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/cm2.jpeg",
                        ),
                        radius: 25,
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/cm0.jpeg",
                        ),
                        radius: 25,
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/cm2.jpeg",
                        ),
                        radius: 25,
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/cm2.jpeg",
                        ),
                        radius: 25,
                      ),
                    ],
                  )
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 4,
              children: getGridViewItems(context),
              shrinkWrap: true,
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class FirstHalf extends StatelessWidget {
  const FirstHalf({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 25, 10, 0),
      child: Column(
        children: <Widget>[
          searchBar(),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Search....",
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          hintStyle: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
