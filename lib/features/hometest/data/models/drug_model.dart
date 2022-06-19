import 'package:dro_hometest/features/hometest/domain/entities/drug.dart';
import 'package:injectable/injectable.dart';

class DrugModel {
  final String name;
  final String desc;
  final String soldBy;
  final String price;
  final String packSize;
  final String productId;
  final String constituents;
  final String dispensedIn;
  final String longDesc;
  final String image;

  const DrugModel(
      {required this.name,
      required this.desc,
      required this.soldBy,
      required this.price,
      required this.packSize,
      required this.productId,
      required this.constituents,
      required this.dispensedIn,
      required this.longDesc,
      required this.image});

  factory DrugModel.fromJson(Map<String, dynamic> json) => DrugModel(
      name: json['name'],
      desc: json['desc'],
      soldBy: json['sold_by'],
      price: json['price'],
      packSize: json['pack_size'],
      productId: json['product_id'],
      constituents: json['const'],
      dispensedIn: json['dispensed_in'],
      longDesc: json['long_desc'],
      image: json['image']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'desc': desc,
        'sold_by': soldBy,
        'price': price,
        'pack_size': packSize,
        'product_id': productId,
        'const': constituents,
        'dispensed_in': dispensedIn,
        'long_desc': longDesc
      };

  Drug toEntity() => Drug(
      name: name,
      desc: desc,
      soldBy: soldBy,
      price: price,
      packSize: packSize,
      productId: productId,
      constituents: constituents,
      dispensedIn: dispensedIn,
      longDesc: longDesc,
      image: image);

  @override
  List<Object> get props => [
        name,
        desc,
        soldBy,
        price,
        packSize,
        productId,
        constituents,
        dispensedIn,
        longDesc,
        image
      ];
}
