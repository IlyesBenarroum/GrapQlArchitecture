import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: 'http://217.79.241.72/graphql'),
  ),
);

GraphQLClient clientToQuery() {
  return GraphQLClient(
    cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    link: HttpLink(uri: 'http://217.79.241.72/graphql'),
  );
}

final String getAllAuctions = """
query{
  auctions{
    id
    auctionDate
    auctionTiming
    auctionPeriod
    entryPrice
  	product{
      id
      serviceProvider
      specialNumber
      type
      arrears
      arrearsValue
    }
  }
}
""";
