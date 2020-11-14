import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grap_ql_architecture/app/modules/home/controllers/home_controller.dart';
// import 'package:grap_ql_architecture/app/modules/home/views/phonecardview.dart';
import 'package:intl/intl.dart';
// import 'auctionscardview.dart';
import 'widgeyts/auctionscardview.dart';
import 'widgeyts/phonecardview.dart';

String text = 'Qima';
String subject = 'Win Auction with friends';

class DetailView extends GetView<HomeController> {
  final int index;
  DetailView({
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    var auctionDetails = true.obs;
    var phoneDetails = true.obs;
    // var lang = Get.locale.languageCode;
    var auctionsList = controller.listAuctions;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
// 2018 06 26 17 0555
    String date = auctionsList[index].getAuctionDate;
    String dateWithT = date.substring(0, 8);
    String time = date.substring(5);

    DateTime dateTime = DateTime.parse(dateWithT);
    DateTime aTime = DateTime.parse(time);
    date = DateFormat("yyyy-MM-dd").format(dateTime);
    time = DateFormat("hh:mm").format(aTime);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * .3,
              width: screenWidth,
              child: CachedNetworkImage(
                imageUrl:
                    "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            ),
            GestureDetector(
              onTap: () {
                // controller.toggleDetail(auctionDetails);
              },
              child: InkWell(
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.08,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: screenHeight * 0.04,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              "Auction_details".tr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: screenHeight * 0.08,
                          child: Icon(
                            Icons.arrow_drop_down,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: auctionDetails.value,
                child: AuctionCardDetailView(
                  date:
                      //  "February".tr + " 03,2021 "
                      "$date",
                  timing: "$time",
                  duration: " 40 " + "Minutes".tr,
                  enteryprice:
                      " ${auctionsList[index].getEntryPrice} " + "Pound".tr,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // controller.toggleDetail(phoneDetails);
              },
              child: InkWell(
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.08,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: screenHeight * 0.04,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              "Number_details".tr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: screenHeight * 0.08,
                          child: Icon(
                            Icons.arrow_drop_down,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: phoneDetails.value,
                child: PhoneCardDetailView(
                  provider: auctionsList[index].getProduct.getServiceProvider,
                  number: "${auctionsList[index].getProduct.getSpecialNumber}",
                  type: "${auctionsList[index].getProduct.getType}",
                  condition: "${auctionsList[index].getProduct.getType}",
                  arrears: "Exist".tr,
                  arrearsvalue: "1000" + "Pound".tr,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Container(
                width: screenWidth * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: screenHeight * 0.0875,
                      width: screenWidth * 0.425,
                      child: RaisedButton(
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Color(0xff3686bd),
                        onPressed: () {
                          // joinAuction();
                        },
                        child: Text('Join'.tr),
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.0875,
                      width: screenWidth * 0.425,
                      child: RaisedButton(
                        textColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Color(0xffffe477),
                        onPressed: () {
                          // addedToIntersted();
                        },
                        child: Text('Interest'.tr),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
