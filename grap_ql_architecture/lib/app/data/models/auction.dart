class Auction {
  String id;
  String auctionDate;
  String auctionTiming;
  String auctionPeriod;
  int entryPrice;
  Product product;
  String get getId => id;

  set setId(String id) => this.id = id;

  String get getAuctionDate => auctionDate;

  set setAuctionDate(String auctionDate) => this.auctionDate = auctionDate;

  String get getAuctionTiming => auctionTiming;

  set setAuctionTiming(String auctionTiming) =>
      this.auctionTiming = auctionTiming;

  String get getAuctionPeriod => auctionPeriod;

  set setAuctionPeriod(String auctionPeriod) =>
      this.auctionPeriod = auctionPeriod;

  int get getEntryPrice => entryPrice;
  Product get getProduct => product;
  set setProduct(Product product) => this.product = product;

  set setEntryPrice(int entryPrice) => this.entryPrice = entryPrice;
  Auction({
    this.id,
    this.auctionDate,
    this.auctionTiming,
    this.auctionPeriod,
    this.entryPrice,
    this.product,
  });
}

class Product {
  String id;
  String serviceProvider;
  int specialNumber;
  String type;
  String arrears;
  int arrearsValue;
  Product({
    this.id,
    this.serviceProvider,
    this.specialNumber,
    this.type,
    this.arrears,
    this.arrearsValue,
  });
  String get getId => id;
  String get getServiceProvider => serviceProvider;

  set setServiceProvider(String serviceProvider) =>
      this.serviceProvider = serviceProvider;

  int get getSpecialNumber => specialNumber;

  set setSpecialNumber(int specialNumber) => this.specialNumber = specialNumber;

  String get getType => type;

  set setType(String type) => this.type = type;

  String get getArrears => arrears;

  set setArrears(String arrears) => this.arrears = arrears;

  int get getArrearsValue => arrearsValue;

  set setArrearsValue(int arrearsValue) => this.arrearsValue = arrearsValue;
}
