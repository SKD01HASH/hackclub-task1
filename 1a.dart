import 'dart:io';

void main() {
  // Get the user input
  print("Enter an expression (e.g. 2 * 3): ");
  String input = stdin.readLineSync()!;

  // Split the input into numbers and operators
  List<String> tokens = input
      .split(RegExp(r'(\d+)|(\s*[+*-/]\s*)'))
      .where((token) => token.isNotEmpty)
      .toList();

  // Parse the input into numbers and operators
  List<double> numbers = [];
  List<String> operators = [];
  String previousToken = "";
  for (String token in tokens) {
    if (token == "+" || token == "-" || token == "*" || token == "/") {
      // This is an operator
      if (previousToken.isNotEmpty && previousToken.contains(RegExp(r'\d+'))) {
        // The operator is preceded by a number, so it is valid
        operators.add(token);
      } else {
        // The operator is not preceded by a number, so it is invalid
        print(
            "Error: Invalid input '$token'. Only numbers and the following operators are allowed: +, -, *, /");
        return;
      }
    } else if (token.isNotEmpty) {
      // This is a number
      try {
        numbers.add(double.parse(token));
      } catch (e) {
        print(
            "Error: Invalid input '$token'. Only numbers and the following operators are allowed: +, -, *, /");
        return;
      }
    }
    previousToken = token;
  }

  // Check if the input is valid
  if (numbers.isEmpty ||
      operators.isNotEmpty && numbers.length != operators.length + 1) {
    print(
        "Error: Invalid expression. Make sure that the expression contains at least one number and that there is a matching number and operator for each operator.");
    return;
  }

  // Perform the calculations
  double result = numbers[0];
  for (int i = 0; i < operators.length; i++) {
    switch (operators[i]) {
      case "+":
        result += numbers[i + 1];
        break;
      case "-":
        result -= numbers[i + 1];
        break;
      case "*":
        result *= numbers[i + 1];
        break;
      case "/":
        result /= numbers[i + 1];
        break;
    }
  }

  // Print the result
  print("Result: $result");
}
