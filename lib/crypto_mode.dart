class CryptoModel {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  int? cmcRank;
  int? numMarketPairs;
  double? circulatingSupply;
  int? totalSupply;
  double? maxSupply;
  bool? infiniteSupply;
  String? lastUpdated;
  String? dateAdded;
  List<String>? tags;
  Map<String, dynamic>? platform;
  num? selfReportedCirculatingSupply;
  double? selfReportedMarketCap;
  Quote? quote;

  CryptoModel({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.cmcRank,
    this.numMarketPairs,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.infiniteSupply,
    this.lastUpdated,
    this.dateAdded,
    this.tags,
    this.platform,
    this.selfReportedCirculatingSupply,
    this.selfReportedMarketCap,
    this.quote,
  });

  CryptoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    cmcRank = json['cmc_rank'];
    numMarketPairs = json['num_market_pairs'];
    circulatingSupply = json['circulating_supply'].toDouble();
    totalSupply = json['total_supply']?.toInt();
    maxSupply = json['max_supply']?.toDouble(); // Convert integer to double
    infiniteSupply = json['infinite_supply'];
    lastUpdated = json['last_updated'];
    dateAdded = json['date_added'];
    tags = json['tags'].cast<String>();
    platform = json['platform'];
    selfReportedCirculatingSupply = json['self_reported_circulating_supply'];
    selfReportedMarketCap = json['self_reported_market_cap'];
    quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['cmc_rank'] = cmcRank;
    data['num_market_pairs'] = numMarketPairs;
    data['circulating_supply'] = circulatingSupply;
    data['total_supply'] = totalSupply;
    data['max_supply'] = maxSupply;
    data['infinite_supply'] = infiniteSupply;
    data['last_updated'] = lastUpdated;
    data['date_added'] = dateAdded;
    data['tags'] = tags;
    data['platform'] = platform;
    data['self_reported_circulating_supply'] = selfReportedCirculatingSupply;
    data['self_reported_market_cap'] = selfReportedMarketCap;
    if (quote != null) {
      data['quote'] = quote!.toJson();
    }
    return data;
  }
}

class Quote {
  USD? uSD;
  BTC? bTC;

  Quote({
    this.uSD,
    this.bTC,
  });

  Quote.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? USD.fromJson(json['USD']) : null;
    bTC = json['BTC'] != null ? BTC.fromJson(json['BTC']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (uSD != null) {
      data['USD'] = uSD!.toJson();
    }
    if (bTC != null) {
      data['BTC'] = bTC!.toJson();
    }
    return data;
  }
}

class USD {
  double? price;
  double? volume24h;
  double? volumeChange24h;
  double? percentChange1h;
  double? percentChange24h;
  double? percentChange7d;
  double? marketCap;
  double? marketCapDominance;
  num? fullyDilutedMarketCap;
  String? lastUpdated;

  USD({
    this.price,
    this.volume24h,
    this.volumeChange24h,
    this.percentChange1h,
    this.percentChange24h,
    this.percentChange7d,
    this.marketCap,
    this.marketCapDominance,
    this.fullyDilutedMarketCap,
    this.lastUpdated,
  });

  USD.fromJson(Map<String, dynamic> json) {
    price = json['price']?.toDouble(); // Convert integer to double
    volume24h = json['volume_24h'];
    volumeChange24h =
        json['volume_change_24h']?.toDouble(); // Convert integer to double
    percentChange1h =
        json['percent_change_1h']?.toDouble(); // Convert integer to double
    percentChange24h =
        json['percent_change_24h']?.toDouble(); // Convert integer to double
    percentChange7d =
        json['percent_change_7d']?.toDouble(); // Convert integer to double
    marketCap = json['market_cap']?.toDouble(); // Convert integer to double
    marketCapDominance = json['market_cap_dominance'];
    fullyDilutedMarketCap = json['fully_diluted_market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['price'] = price;
    data['volume_24h'] = volume24h;
    data['volume_change_24h'] = volumeChange24h;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_7d'] = percentChange7d;
    data['market_cap'] = marketCap;
    data['market_cap_dominance'] = marketCapDominance;
    data['fully_diluted_market_cap'] = fullyDilutedMarketCap;
    data['last_updated'] = lastUpdated;
    return data;
  }
}

class BTC {
  double? price;
  int? volume24h;
  double? volumeChange24h;
  double? percentChange1h;
  double? percentChange24h;
  double? percentChange7d;
  double? marketCap;
  int? marketCapDominance;
  double? fullyDilutedMarketCap;
  String? lastUpdated;

  BTC({
    this.price,
    this.volume24h,
    this.volumeChange24h,
    this.percentChange1h,
    this.percentChange24h,
    this.percentChange7d,
    this.marketCap,
    this.marketCapDominance,
    this.fullyDilutedMarketCap,
    this.lastUpdated,
  });

  BTC.fromJson(Map<String, dynamic> json) {
    price = json['price']?.toDouble(); // Convert integer to double
    volume24h = json['volume_24h'];
    volumeChange24h =
        json['volume_change_24h']?.toDouble(); // Convert integer to double
    percentChange1h =
        json['percent_change_1h']?.toDouble(); // Convert integer to double
    percentChange24h =
        json['percent_change_24h']?.toDouble(); // Convert integer to double
    percentChange7d =
        json['percent_change_7d']?.toDouble(); // Convert integer to double
    marketCap = json['market_cap']?.toDouble(); // Convert integer to double
    marketCapDominance = json['market_cap_dominance'];
    fullyDilutedMarketCap = json['fully_diluted_market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['price'] = price;
    data['volume_24h'] = volume24h;
    data['volume_change_24h'] = volumeChange24h;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_7d'] = percentChange7d;
    data['market_cap'] = marketCap;
    data['market_cap_dominance'] = marketCapDominance;
    data['fully_diluted_market_cap'] = fullyDilutedMarketCap;
    data['last_updated'] = lastUpdated;
    return data;
  }
}
