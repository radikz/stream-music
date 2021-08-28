
class Converter {
  String convertMillis(double ms) {
    int seconds = ((ms / 1000) % 60).toInt() ;
    int minutes = ((ms / (1000*60)) % 60).toInt();
    int hours   = ((ms / (1000*60*60)) % 24).toInt();

    return "${hours < 10 ? "0" : ""}$hours:"
        "${minutes < 10 ? "0" : ""}$minutes:"
        "${seconds < 10 ? "0" : ""}$seconds";
  }
}