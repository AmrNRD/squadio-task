// ignore: avoid_classes_with_only_static_members
class TimeUtils {
  static int get nowMillis => DateTime.now().millisecondsSinceEpoch;
  static int get nowSeconds => (nowMillis * .001).round();
}
