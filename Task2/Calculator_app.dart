//NAME:- ERMIAS DEREJE
//ID:- ATE/4952/15

void main() {
  // create a list of numbers
  final List<int> numbers = [34, -7, 89, 12, -45, 67, 3, 100, -2, 55];
  
  // Test case with empty list to verify guards
  // final List<int> numbers = [];
  
  int maxNumber = findMax(numbers); 
  int minNumber = findMin(numbers); 
  int sum = calculateSum(numbers); 
  double average = calculateAverage(numbers);
  int negatives = countNegative(numbers);
  int positives = countPositive(numbers);
  List<int> evens = filterEven(numbers);
  List<int> odds = filterOdd(numbers);
  List<int> sortedList = selectionSort(numbers);
  
  // here we display the result by using string interpolation "${}"
  // to add the variables declared above
  print("Number Analysis Result\n======================");
  print("Numbers: $numbers");
  print("Maximum Value: $maxNumber");
  print("Minimum Value: $minNumber");
  print("Sum          : $sum");
  print("Average      : $average");
  print("Even Numbers : $evens (Count: ${evens.length})");
  print("Odd Numbers  : $odds (Count: ${odds.length})");
  print("Positive Number(s): $positives");
  print("Negative Number(s): $negatives");
  print("Sorted List  : $sortedList");
}

// ------------------------------------------------------------------------------------------------
// find the maximum number from a list of integers
// ------------------------------------------------------------------------------------------------
int findMax(List<int> numbers) {
  if (numbers.isEmpty) {
    print("Error [findMax]: The list is empty. Returning 0 as default.");
    return 0;  
  }
  
  /* --- Original Implementation (Manual Loop) ---
  int max = numbers[0];
  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] > max) max = numbers[i];
  }
  return max;
  */

  // --- Collection Methods Comparison Implementation ---
  // Using .reduce() simplifies finding the max by comparing elements pair-wise. 
  // Trade-off: Much more concise and readable, but creating manual loops is slightly 
  // faster in highly performance-critical code since reduce involves callback overhead.
  return numbers.reduce((curr, next) => curr > next ? curr : next);
}

// ------------------------------------------------------------------------------------------------
// find the minimum number from a list of integers
// ------------------------------------------------------------------------------------------------
int findMin(List<int> numbers) {
  if (numbers.isEmpty) {
    print("Error [findMin]: The list is empty. Returning 0 as default.");
    return 0;  
  }
  
  /* --- Original Implementation (Manual Loop) ---
  int min = numbers[0]; 
  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] < min) min = numbers[i];
  }
  return min; 
  */

  // --- Collection Methods Comparison Implementation ---
  // Like findMax, .reduce is perfect for taking a collection down to a single value.
  return numbers.reduce((curr, next) => curr < next ? curr : next);
}

// ------------------------------------------------------------------------------------------------
// calculate the sum of numbers in the list
// ------------------------------------------------------------------------------------------------
int calculateSum(List<int> numbers) {
  if (numbers.isEmpty) {
    print("Error [calculateSum]: The list is empty. Returning 0 as default.");
    return 0; 
  }
  
  /* --- Original Implementation (Manual Loop) ---
  int sum = 0; 
  for (int number in numbers) {
    sum += number; 
  }
  return sum; 
  */

  // --- Collection Methods Comparison Implementation ---
  // Using .fold() we provide an initial start value (0) and add each element.
  // Trade-off: Less boilerplate than manually maintaining a `sum` variable, 
  // but similar to reduce, the callback adds slight computational overhead.
  return numbers.fold(0, (previousValue, element) => previousValue + element);
}

// ------------------------------------------------------------------------------------------------
// calculate the average of numbers in the list
// ------------------------------------------------------------------------------------------------
double calculateAverage(List<int> numbers) {
  if (numbers.isEmpty) {
    print("Error [calculateAverage]: The list is empty. Returning 0.0 as default.");
    return 0.0; 
  }
  // The implementation stays the same, as it rightly re-uses calculateSum.
  return calculateSum(numbers) / numbers.length; 
}

// ------------------------------------------------------------------------------------------------
// Filter Even Numbers
// ------------------------------------------------------------------------------------------------
List<int> filterEven(List<int> list) {
  if (list.isEmpty) return [];

  /* --- Original Implementation (Manual Loop) ---
  List<int> evens = [];
  for (int number in list) {
    if (number % 2 == 0) evens.add(number);
  }
  return evens;
  */

  // --- Collection Methods Comparison Implementation ---
  // Using .where() to filter out elements matching a condition.
  // Trade-off: Much safer (immutable style) and concise. Returns an Iterable, so we call .toList().
  // Renamed parameter 'num' to 'number' to avoid conflict with the built-in 'num' type.
  return list.where((number) => number % 2 == 0).toList();
}

// ------------------------------------------------------------------------------------------------
// Filter Odd Numbers
// ------------------------------------------------------------------------------------------------
List<int> filterOdd(List<int> list) {
  if (list.isEmpty) return [];

  /* --- Original Implementation (Manual Loop) ---
  List<int> odds = [];
  for (int number in list) {
    if (number % 2 != 0) odds.add(number);
  }
  return odds;
  */

  // --- Collection Methods Comparison Implementation ---
  // Renamed parameter 'num' to 'number' to avoid conflict with the built-in 'num' type.
  return list.where((number) => number % 2 != 0).toList();
}

// ------------------------------------------------------------------------------------------------
// Count Positive Numbers
// ------------------------------------------------------------------------------------------------
int countPositive(List<int> list) {
  if (list.isEmpty) return 0;
  
  /* --- Original Implementation (Manual Loop) ---
  int count = 0;
  for (int number in list) {
    if (number > 0) count++;
  }
  return count;
  */

  // --- Collection Methods Comparison Implementation ---
  // Renamed parameter 'num' to 'number' to avoid conflict with the built-in 'num' type.
  return list.where((number) => number > 0).length;
}

// ------------------------------------------------------------------------------------------------
// count how many negative numbers there are
// ------------------------------------------------------------------------------------------------
int countNegative(List<int> numbers){
  if(numbers.isEmpty) {
     print("Error [countNegative]: The list is empty. Returning 0 as default.");
     return 0;
  }
  
  /* --- Original Implementation (Manual Loop) ---
  int count = 0; 
  for(int number in numbers) {
    if (number < 0) count++; 
  }
  return count; 
  */

  // --- Collection Methods Comparison Implementation ---
  // Filters for negative numbers and gets the count explicitly. Very clean readability!
  // Renamed parameter 'num' to 'number' to avoid conflict with the built-in 'num' type.
  return numbers.where((number) => number < 0).length;
}

// ------------------------------------------------------------------------------------------------
// selection sort algorithm for ordering elements in increasing order (Challenge 3 handled here)
// ------------------------------------------------------------------------------------------------
List<int> selectionSort(List<int> numbers) {
  if (numbers.isEmpty) {
    print("Error [selectionSort]: The list is empty. Returning empty list as default.");
    return [];
  }
  
  List<int> sortedNumbers = List.from(numbers); // sort on a copy to avoid mutating the original
  for (int i = 0; i < sortedNumbers.length - 1; i++){
    int minPos = i; 
    for (int j = i + 1; j < sortedNumbers.length; j++){
      if(sortedNumbers[j] < sortedNumbers[minPos]){
        minPos = j;
      }  
    }
    if (minPos != i){
      int temp = sortedNumbers[i]; 
      sortedNumbers[i] = sortedNumbers[minPos];
      sortedNumbers[minPos] = temp;
    }
  }
  return sortedNumbers; 
}
