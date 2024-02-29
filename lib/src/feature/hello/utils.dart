String needleFromHaystack(String needle, String haystack) {
  Map<String, int> haystackCount = {};

  for (var char in haystack.split("")) {
    haystackCount[char] = (haystackCount[char] ?? 0) + 1;
  }

  String response = '';

  for (var char in needle.split("")) {
    if (haystackCount[char] != null && haystackCount[char]! > 0) {
      response += char;
      haystackCount[char] = haystackCount[char]! - 1;
    }
  }

  return response;
}
