import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sliver_fab/sliver_fab.dart';

class SliverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: MyAppBar(
              expandedHeight: 200.0,
            ),
            pinned: true,
            floating: true,
          ),
          // SliverAppBar(
          //   //pinned: true,
          //   // backgroundColor: Colors.transparent,
          //   // elevation: 0.0,
          //   // title: Text('SliverAppBar'),
          //   // expandedHeight: 200.0,
          //   // flexibleSpace: FlexibleSpaceBar(
          //   //   background: Image.asset('assets/images/hotel0.jpg', fit: BoxFit.cover),
          //   // ),
          //   // snap: true,
          //   // floating: true,

          // ),
          SliverFixedExtentList(
            itemExtent: 150.0,
            delegate: SliverChildListDelegate(
              [
                Container(color: Colors.red),
                Container(color: Colors.purple),
                Container(color: Colors.green),
                Container(color: Colors.orange),
                Container(color: Colors.yellow),
                Container(color: Colors.pink),
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
          height: 100,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).padding.top,
            ),
            child: Opacity(
              opacity: shrinkOffset / expandedHeight,
              child: Text(
                "MySliverAppBar",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                ),
              ),
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
