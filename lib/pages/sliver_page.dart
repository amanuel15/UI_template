import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliver_fab/sliver_fab.dart';

class SliverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverPersistentHeader(
          //   delegate: MyAppBar(
          //     expandedHeight: 200.0,
          //   ),
          //   pinned: true,
          //   floating: true,
          // ),
          SliverAppBar(
            //pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text('SliverAppBar'),
            //expandedHeight: 200.0,
            // flexibleSpace: FlexibleSpaceBar(
            //   background: Image.asset('assets/images/hotel0.jpg', fit: BoxFit.cover),
            // ),
            snap: true,
            floating: true,
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      size: 26.0,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(FontAwesomeIcons.filter, size: 18.0,),
                  )),
            ],
          ),
          SliverFixedExtentList(
            itemExtent: 150.0,
            delegate: SliverChildListDelegate(
              [
                Container(color: Colors.red),
                Container(color: Colors.purple),
                Container(color: Colors.green),
                Container(color: Colors.orange),
                Container(color: Colors.yellow),
                Container(color: Colors.black),
                Container(color: Colors.amber),
                Container(color: Colors.lime),
                Container(color: Colors.deepOrange),
                Container(color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MyAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.asset(
          'assets/images/hotel0.jpg',
          fit: BoxFit.cover,
        ),
        Positioned(
          //top: MediaQuery.of(context).padding.top,
          height: MediaQuery.of(context).size.height * 0.13,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 30.0,
                  color: Colors.black,
                  onPressed: () => Navigator.pop(context),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => {},
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.filter),
                      iconSize: 20.0,
                      color: Colors.black,
                      onPressed: () => {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
