// To parse this JSON data, do
//
//     final auctionRes = auctionResFromJson(jsonString);

import 'dart:convert';

AuctionRes auctionResFromJson(String str) => AuctionRes.fromJson(json.decode(str));

String auctionResToJson(AuctionRes data) => json.encode(data.toJson());

class AuctionRes {
  AuctionRes({
    this.auctions,
  });

  List<Auction> auctions;

  factory AuctionRes.fromJson(Map<String, dynamic> json) => AuctionRes(
    auctions: List<Auction>.from(json["Auctions"].map((x) => Auction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Auctions": List<dynamic>.from(auctions.map((x) => x.toJson())),
  };
}

class Auction {
  Auction({
    this.id,
    this.firmName,
    this.cases,
    this.phone,
    this.noOfAssets,
    this.auctionCompany,
  });

  int id;
  String firmName;
  int cases;
  String phone;
  int noOfAssets;
  String auctionCompany;

  factory Auction.fromJson(Map<String, dynamic> json) => Auction(
    id: json["id"],
    firmName: json["firm_name"],
    cases: json["cases"],
    phone: json["phone"],
    noOfAssets: json["no_of_assets"],
    auctionCompany: json["auction_company"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firm_name": firmName,
    "cases": cases,
    "phone": phone,
    "no_of_assets": noOfAssets,
    "auction_company": auctionCompany,
  };
}
