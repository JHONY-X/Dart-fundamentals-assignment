void main() {
  List<int> numbers = [-19, 12, 5, 6, 2, 10, 7, -54, 39, 42, 49];

  print(''' 
            Number Analysis
  ========================================''');
  print('Numbers: $numbers');
  print('Maximum value: ${findMax(numbers)}');
  print('Minimum value: ${findMin(numbers)}');
  print('Sum: ${calculateSum(numbers)}');
  print('Average: ${calculateAverage(numbers).toStringAsFixed(2)}');
  print(
    'Even Numbers: ${filterEven(numbers)} (Count: ${filterEven(numbers).length})',
  );
  print(
    'Odd Numbers: ${filterOdd(numbers)} (Count: ${filterOdd(numbers).length})',
  );
  print('Positive Numbers Count: ${countPositive(numbers)}');
  print('Negative Numbers Count: ${countNegative(numbers)}');
}

int calculateSum(List<int> list) {
  int sum = 0;
  for (int num in list) {
    sum += num;
  }
  return sum;
}

double calculateAverage(List<int> list) {
  if (list.isEmpty) return 0.0;
  return calculateSum(list) / list.length;
}

int findMax(List<int> list) {
  if (list.isEmpty) throw Exception('List is empty');
  int max = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] > max) {
      max = list[i];
    }
  }
  return max;
}

int findMin(List<int> list) {
  if (list.isEmpty) throw Exception('List is empty');
  int min = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] < min) {
      min = list[i];
    }
  }
  return min;
}

List<int> filterEven(List<int> list) {
  List<int> evens = [];
  for (int num in list) {
    if (num % 2 == 0) {
      evens.add(num);
    }
  }
  return evens;
}

List<int> filterOdd(List<int> list) {
  List<int> odds = [];
  for (int num in list) {
    if (num % 2 != 0) {
      odds.add(num);
    }
  }
  return odds;
}

int countPositive(List<int> list) {
  int count = 0;
  for (int num in list) {
    if (num > 0) {
      count++;
    }
  }
  return count;
}

int countNegative(List<int> list) {
  int count = 0;
  for (int num in list) {
    if (num < 0) {
      count++;
    }
  }
  return count;
}
