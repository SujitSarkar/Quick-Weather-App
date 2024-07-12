int kelvinToCelcius({required double tempInKelvin}) {
  return (tempInKelvin - 273.15).round();
}

String getTimeInHourMinute(int startTimestamp, int endTimestamp) {
  final sunrise = DateTime.fromMillisecondsSinceEpoch(startTimestamp);
  final sunset = DateTime.fromMillisecondsSinceEpoch(endTimestamp);
  final difference = sunset.difference(sunrise);

  return '${difference.inHours} hours ${difference.inMinutes.remainder(60)} minutes';
}
