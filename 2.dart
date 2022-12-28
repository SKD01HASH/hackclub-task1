import 'dart:io';

void main() {
  int n = int.parse(stdin.readLineSync()!);
  List<double> numbers =
      stdin.readLineSync()!.split(' ').map(double.parse).toList();
  double max = double.negativeInfinity;
  for (double num in numbers) {
    if (num > max) {
      max = num;
    }
  }
  print(max);
}
