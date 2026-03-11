//NAME:-ERMIAS DEREJE
//ID:- ATE/4952/15


import 'dart:async';

class DivisionByZeroException implements Exception {
  final String message;
  DivisionByZeroException([this.message = 'Cannot divide by zero']);
  @override
  String toString() => 'DivisionByZeroException: $message';
}

class Calculator {
  Future<double> add(double a, double b) async {
    await _simulateNetworkDelay();
    return a + b;
  }

  Future<double> subtract(double a, double b) async {
    await _simulateNetworkDelay();
    return a - b;
  }

  Future<double> multiply(double a, double b) async {
    await _simulateNetworkDelay();
    return a * b;
  }

  Future<double> divide(double a, double b) async {
    await _simulateNetworkDelay();
    if (b == 0) {
      throw DivisionByZeroException();
    }
    return a / b;
  }

  Future<void> _simulateNetworkDelay() async {
    print('[1.5 second pause]');
    // Simulate a network delay of 1.5 seconds
    await Future.delayed(Duration(milliseconds: 1500));
  }
}

void main() async {
  final calc = Calculator();

  print('--- MyCalculator ---');

  try {
    double res1 = await calc.add(25.5, 14.5);
    print('add(25.5, 14.5) = $res1');

    double res2 = await calc.subtract(100.0, 45.0);
    print('subtract(100.0, 45.0) = $res2');

    double res3 = await calc.multiply(7.0, 8.0);
    print('multiply(7.0, 8.0) = $res3');

    double res4 = await calc.divide(50.0, 2.0);
    print('divide(50.0, 2.0) = $res4');

    double res5 = await calc.divide(81.0, 9.0);
    print('divide(81.0, 9.0) = $res5');

    await calc.divide(20.0, 0.0);
  } on DivisionByZeroException catch (e) {
    print('Error: ${e.message}');
  } catch (e) {
    print('An unexpected error occurred: $e');
  } finally {
    print('All calculations complete.');
  }
}

