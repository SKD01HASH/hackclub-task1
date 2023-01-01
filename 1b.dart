import 'dart:io';

calculate(int a, int b, var operators) {
  if (operators == '+') {
    int sum = a + b;
    return sum;
  } else if (operators == '-') {
    int diff = a - b;
    return diff;
  } else if (operators == '*') {
    int product = a * b;
    return product;
  } else if (operators == '/') {
    double div = a / b;
    return div;
  }
}

void main() {
  print("Enter first number");
  int? a = int.parse(stdin.readLineSync()!);
  print("Enter second number");
  int? b = int.parse(stdin.readLineSync()!);
  print("Enter the operation +/-*");
  var op = stdin.readLineSync();

  int out = calculate(a, b, op);
  print("The output is");
  print(out);
}
