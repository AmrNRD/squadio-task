enum Unit { metric, imperial }
enum Gender { male, female, other }
class UnitUtility{
  static Gender stringToGender(String gender) {
    switch (gender) {
      case "Male":
        return Gender.male;
      case "Female":
        return Gender.female;
      case "Other":
        return Gender.other;
      default:
        return Gender.male;
    }
  }

  static Unit stringToUnit(String unit) {
    switch (unit) {
      case "metric":
        return Unit.metric;
      case "imperial":
        return Unit.imperial;
      default:
        return Unit.metric;
    }
  }

  static double ounceToMilliliters(double value) {
    return 29.5735296 * value;
  }
  static double ounceToGallons(double value) {
    return 0.0078125 * value;
  }
  static double millilitersToOunce(double value) {
    return value*0.0338140227;
  }
  static double poundsToKG(double value) {
    return value*0.45359237;
  }
  static double gramToPounds(double value) {
    return value*0.00220462262;
  }

}

