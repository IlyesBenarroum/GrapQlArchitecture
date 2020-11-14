import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:grap_ql_architecture/app/modules/home/views/viewinfo.dart';

import 'viewinfo.dart';

class AuctionCardDetailView extends GetView {
  const AuctionCardDetailView({
    Key key,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.date,
    @required this.timing,
    @required this.duration,
    @required this.enteryprice,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  final String date;
  final String timing;
  final String duration;
  final String enteryprice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        child: Container(
          width: screenWidth * 0.9,
          // height: screenHeight * .37,
          child: Column(
            children: [
              AuctionDetailInfoView(
                screenHeight: screenHeight,
                title: "Auction_date".tr,
                info: date,
                // icon: "",
              ),
              Divider(
                color: Colors.grey[300],
              ),
              AuctionDetailInfoView(
                screenHeight: screenHeight,
                title: "Auction_Timing".tr,
                info: timing,
                // icon: ""
                //data to card detail
              ),
              Divider(
                color: Colors.grey[300],
              ),
              AuctionDetailInfoView(
                screenHeight: screenHeight,
                title: "Auction_period".tr,
                info: duration,
                // icon: "",
              ),
              Divider(
                color: Colors.grey[300],
              ),
              AuctionDetailInfoView(
                screenHeight: screenHeight,
                title: "Auction_entry_price".tr,
                info: enteryprice,
                // icon: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
