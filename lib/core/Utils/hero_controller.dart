import 'package:get/get.dart';

class GetHeroController extends GetxController {
  static GetHeroController get to => Get.find();

  final Map<String, int> _heroCounters = {};

  String getUniqueHeroTag(String baseTag) {
    final count = (_heroCounters[baseTag] ?? 0) + 1;
    _heroCounters[baseTag] = count;
    return '$baseTag-$count';
  }
}
