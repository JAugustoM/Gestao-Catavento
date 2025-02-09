String formatTime(String time) {
  if (time.length == 19) {
    final formatted = time.substring(11);

    return formatted;
  } else {
    return time;
  }
}
