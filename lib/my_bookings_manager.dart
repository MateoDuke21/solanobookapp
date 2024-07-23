class MyBookingsManager {
  static final List<Map<String, String>> _bookings = [];

  static List<Map<String, String>> get bookings => _bookings;

  static void addBooking(Map<String, String> booking) {
    _bookings.add(booking);
  }

  static void removeBooking(Map<String, String> booking) {
    _bookings.remove(booking);
  }
}
