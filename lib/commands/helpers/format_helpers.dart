import 'package:intl/intl.dart';

class FormatConverter {
  getTimeFormat(int date) {
    var dt = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    return DateFormat('HH:mm a').format(dt);
  }

  getCelcTemp(double temp) {
    var celc2 = 273.15;
    var res = temp - celc2;
    return res.toInt();
  }

  getDateFormat(int date) {
    var millis = date;
    var dt = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    return DateFormat('dd.MMMM.yyyy').format(dt);
  }
}
