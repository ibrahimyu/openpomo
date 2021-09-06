String displayTime(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes =
      twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour));
  String twoDigitSeconds =
      twoDigits(duration.inSeconds.remainder(Duration.secondsPerMinute));
  return "${duration.inHours > 0 ? (duration.inHours.toString() + ':') : ''}$twoDigitMinutes:$twoDigitSeconds";
}
