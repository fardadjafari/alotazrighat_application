// ignore_for_file: constant_identifier_names

enum RequestStatus {
  PendingToAccept,
  TimeOut,
  CancelByNurse,
  RejectByCustomer,
  Accept,
  RefundToCustomer,
  RejectByAdmin,
  PendingToPay,
  PayTimeOut,
  Finish
}

class RequestStatusExtensions {
  static String translateToFarsi(int statusCode) {
    String result = "Null Type";
    switch (statusCode) {
      case 0:
        result = "در انتظار تایید پرستار";
        break;

      case 1:
        result = "منسوخ شده";
        break;

      case 2:
        result = "لغو توسط پرستار";
        break;

      case 3:
        result = "لغو توسط کارفرما";
        break;

      case 4:
        result = "تایید توسط پرستار";
        break;

      case 5:
        result = "برگشت هزینه";
        break;

      case 6:
        result = "لغو توسط مدیریت";
        break;

      case 7:
        result = "در انتظار پرداخت";
        break;

      case 8:
        result = "اتمام زمان پرداخت";
        break;

      case 9:
        result = "انجام شده";
        break;
    }
    return result;
  }
}
