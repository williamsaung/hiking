// * Http
enum RequestMethod { get, post, put, delete, postWithFile, patch }

// * Server
enum Environment { local, dev, uat, prod }

// * Page Type
enum PageType { create, edit }

enum CampsiteStatus { pending, accepted, rejected, paymentInfoFilled }

enum BookingStatus { pending, waitingPayment, paymentComplete, approved }

extension BookingStatusExtension on BookingStatus {
  String get text {
    switch (this) {
      case BookingStatus.pending:
        return "Pending";
      case BookingStatus.waitingPayment:
        return "Waiting Payment";
      case BookingStatus.paymentComplete:
        return "Payment Complete";
      case BookingStatus.approved:
        return "Approved";
    }
  }

  int get number {
    switch (this) {
      case BookingStatus.pending:
        return 0;
      case BookingStatus.waitingPayment:
        return 1;
      case BookingStatus.paymentComplete:
        return 2;
      case BookingStatus.approved:
        return 3;
    }
  }

  static BookingStatus fromInt(int value) {
    switch (value) {
      case 0:
        return BookingStatus.pending;
      case 1:
        return BookingStatus.waitingPayment;
      case 2:
        return BookingStatus.paymentComplete;
      case 3:
        return BookingStatus.approved;
      default:
        throw ArgumentError("Invalid Booking Status value");
    }
  }
}
