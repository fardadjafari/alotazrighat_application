enum SexType { Male, Female }

class SexTypeExtensions {
  static String translateToFarsi(int statusCode) {
    String result = "Null Type";
    switch (statusCode) {
      case 0:
        result = "مرد";
        break;

      case 1:
        result = "زن";
        break;
    }
    return result;
  }
}
