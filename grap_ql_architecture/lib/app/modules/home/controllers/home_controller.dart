import 'package:get/get.dart';
import 'package:grap_ql_architecture/app/data/models/auction.dart';
import 'package:grap_ql_architecture/app/data/api.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeController extends GetxController {
  List<Auction> listAuctions = List<Auction>().obs;
  @override
  void onInit() {
    super.onInit();
    fillList();
  }

  void fillList() async {
    GraphQLClient _client = clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: getAllAuctions,
      ),
    );

    var data = result.data["auctions"];
    if (!result.hasException) {
      for (var i = 0; i < data.length; i++) {
        listAuctions.add(
          Auction(
            id: data[i]["id"],
            auctionDate: data[i]["auctionDate"],
            auctionPeriod: data[i]["auctionPeriod"],
            auctionTiming: data[i]["auctionTiming"],
            entryPrice: data[i]["entryPrice"],
            product: Product(
              id: data[i]["product"]["id"],
              serviceProvider: data[i]["product"]["serviceProvider"],
              specialNumber: data[i]["product"]["specialNumber"],
              arrears: data[i]["product"]["arrears"],
              arrearsValue: data[i]["product"]["arrearsValue"],
              type: data[i]["product"]["type"],
            ),
          ),
        );
      }
    }
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
