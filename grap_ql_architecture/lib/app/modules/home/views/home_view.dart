import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grap_ql_architecture/app/modules/home/controllers/home_controller.dart';
import 'widgeyts/auction_card.dart';
import 'detail_view.dart';

class HomeView extends GetView<HomeController> {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var auctionsList = controller.listAuctions;
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(
        () => GetUtils.isNullOrBlank(controller.listAuctions)
            ? Center(child: Text("Loading"))
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: Get.height * 0.175,
                    width: Get.width,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          DetailView(index: index),
                        );
                      },
                      child: AuctionCard(
                        type: 0,
                        icon:
                            "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
                        number:
                            "${auctionsList[index].getProduct.getSpecialNumber}",
                        screenHeight: Get.height,
                        screenWidth: Get.width,
                      ),
                    ),
                  );
                },
                itemCount: controller.listAuctions.length,
              ),
      ),
    );
  }
}

