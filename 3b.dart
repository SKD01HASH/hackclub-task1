import 'dart:io';

void main() {
  // Read the number of students
  int n = int.tryParse(stdin.readLineSync()!) ?? 0;

  // Create a list of ranges
  List<String> ranges = [
    "0-10",
    "11-20",
    "21-30",
    "31-40",
    "41-50",
    "51-60",
    "61-70",
    "71-80",
    "81-90",
    "91-100"
  ];

  // Initialize a map to store the count for each range
  Map<String, int> rangeCounts = {};
  for (String range in ranges) {
    rangeCounts[range] = 0;
  }

  // Read the names and scores
  List<String> names = [];
  List<int> scores = [];
  for (int i = 0; i < n; i++) {
    String input = stdin.readLineSync() ?? "";
    int index = input.indexOf(":");
    names.add(input.substring(0, index));
    scores.add(int.tryParse(input.substring(index + 1)) ?? 0);
  }

  // Iterate through the scores and update the range counts
  for (int i = 0; i < n; i++) {
    int score = scores[i];
    String range = getRange(score);
    rangeCounts[range] = (rangeCounts[range] ?? 0) + 1;
  }

  // Print the range counts
  for (String range in ranges) {
    print("$range ${rangeCounts[range]}");
  }
}

String getRange(int score) {
  int lower = (score ~/ 10) * 10;
  int upper = lower + 9;
  return "$lower-$upper";
}
