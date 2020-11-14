import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class AuctionCard extends StatelessWidget {
  const AuctionCard({
    @required this.type,
    @required this.icon,
    @required this.number,
    // @required this.info,
    // @required this.asset,
    // @required this.asset2,
    // @required this.title,
    // @required this.title2,
    // @required this.subtitle,
    // @required this.subtitle2,
    @required this.screenHeight,
    @required this.screenWidth,
    Key key,
  }) : super(key: key);
  //type 0 for main and created auctions
  //type 1 for joined
  //type 2 intersted auction
  final int type;
  final String icon;
  final String number;

  // final String title;
  // final String title2;
  // final String subtitle;
  // final String subtitle2;
  final double screenHeight;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenHeight * 0.025,
        vertical: screenHeight * 0.01,
      ),
      height: screenHeight * 0.175,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        shadowColor: Colors.grey[100],
        child: Padding(
          padding: EdgeInsets.all(screenHeight * 0.02),
          child: Row(
            children: [
              //image Container
              Container(
                height: screenHeight * 0.10,
                width: screenHeight * 0.10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: icon,
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                    fit: BoxFit.fill,
                  ),
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(0, 1),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
              //info row & Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              number,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.07,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
