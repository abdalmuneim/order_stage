class Facility {
  final int? id;
  final bool? hasPromo;
  final bool? loyaltySubscription;
  final bool? isLocally;
  final bool? isTakeAway;
  final bool? isDelivery;
  final bool? isBookTable;
  final String? arFullName;
  final String? enFullName;
  final String? mainCat;
  final double? overAllRating;
  final String? overAllRatingString;
  final double? commRate;
  final double? distance;
  final bool? appDlv;
  final bool? isFav;
  final bool? restDlv;
  final int? minInDistInvAmount;
  final int? minOutDistInvAmount;

  Facility(
      {required this.id,
      required this.hasPromo,
      required this.distance,
      required this.isFav,
      required this.isLocally,
      required this.isBookTable,
      required this.isTakeAway,
      required this.loyaltySubscription,
      required this.arFullName,
      required this.enFullName,
      required this.mainCat,
      required this.overAllRating,
      required this.overAllRatingString,
      required this.commRate,
      required this.appDlv,
      required this.isDelivery,
      required this.restDlv,
      required this.minInDistInvAmount,
      required this.minOutDistInvAmount});
}

enum DelivryTypeEnum {
  app_dlv,
  free,
  without_cond,
  with_cond,
}
