// * Http
enum RequestMethod { get, post, put, delete, postWithFile, patch }

// * Server
enum Environment { local, dev, uat, prod }

// * Page Type
enum PageType { create, edit }

enum CampsiteStatus { pending, accepted, rejected, paymentInfoFilled }

enum BookingStatus { pending, waitingPayment, paymentComplete }

extension BookingStatusExtension on BookingStatus {
  String get text {
    switch (this) {
      case BookingStatus.pending:
        return "Pending";
      case BookingStatus.waitingPayment:
        return "Waiting Payment";
      case BookingStatus.paymentComplete:
        return "Payment Complete";
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
      default:
        throw ArgumentError("Invalid Booking Status value");
    }
  }
}
