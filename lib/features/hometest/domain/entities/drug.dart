class Drug {
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

  const Drug({
    required this.name,
    required this.desc,
    required this.soldBy,
    required this.price,
    required this.packSize,
    required this.productId,
    required this.constituents,
    required this.dispensedIn,
    required this.longDesc,
    required this.image,
  });

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
        image,
      ];
}
