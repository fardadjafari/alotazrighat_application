enum FeelingRate { bad, weak, average, good, best }

class FeelingTypeExtensions {
  static String translateToFarsi(double statusCode) {
    String result = "Null Type";
    switch (statusCode) {
      case 1:
        result = "Bad";
        break;

      case 2:
        result = "Weak";
        break;

      case 3:
        result = "Average";
        break;

      case 4:
        result = "Good";
        break;

      case 5:
        result = "Best";
        break;
    }
    return result;
  }
}
