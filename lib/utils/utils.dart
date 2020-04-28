localToEmoji(country) {
  int flagOffset = 0x1F1E6;
  int asciiOffset = 0x41;


  int firstChar = country.codeUnitAt(0) - asciiOffset + flagOffset;
  int secondChar = country.codeUnitAt(1) - asciiOffset + flagOffset;

  String emoji =
      String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
  return emoji;
}