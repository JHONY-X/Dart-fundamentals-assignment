# Reflection

## Task 1 – Number Analysis

In this task, I implemented list processing using loops and conditional statements. 
The program analyzes a user-provided list of integers and calculates statistical 
and logical properties such as sum, average, minimum, maximum, and count of even, 
odd, positive, and negative numbers.

This task strengthened my understanding of:
- Iteration using `for-in` loops
- Conditional branching
- Input parsing
- Basic error handling

---

## Task 2 – Async Calculator App

For this task, I built an object-oriented calculator using a class-based design. 
Each arithmetic operation was implemented as an asynchronous method using `Future` 
and `async/await`.

I also implemented exception handling to prevent:
- Division by zero
- Invalid operations
- Incorrect input types

This task improved my understanding of:
- OOP principles
- Asynchronous programming in Dart
- Exception handling using try-catch

---

## Questions & Answers

**QR1. Which concept was hardest to understand: lists and loops, classes and methods, exception handling, or async/await? Walk through the specific moment of confusion and explain how you eventually understood it.**

The hardest concept to grasp was **async/await**. Specifically, my moment of confusion came when trying to use values returned by asynchronous methods. Initially, I expected the code to just pause and return the value directly, but my variables were resolving as `Future<double>` instead of `double`. I eventually realized that calling an `async` function without `await` immediately returns a "promise" (a Future) for a later value, not the value itself. Understanding that `await` is required to literally "unwrap" the value from the Future before using it helped this concept finally click.

**QR2. Look at your Task 1 solution. If you had to change your code to analyze a list of floating-point numbers (`List<double>`) instead of integers, how many places in your code would need to change? What does this tell you about the importance of thinking about data types during design?**

If I had to change the input to a `List<double>`, I would need to change approximately 24 different type declarations across my code. This includes every function parameter (`List<int> list`), return type (`int`), loop variables (`int num`), and list initialization (`List<int> numbers`). Additionally, mathematical concepts like "even" and "odd" using modulo (`% 2 == 0`) do not practically apply to floating-point numbers, meaning whole functions like `filterEven` and `filterOdd` would need logic changes or removal. 

This taught me a vital lesson: **hardcoding specific types makes the code rigid and difficult to refactor.** It highlights the importance of using Generics (e.g., `<T extends num>`) early in the design process to create flexible, reusable methods that aren't tightly coupled to a single data type.

**QR3. In Task 2, you simulated a network delay using `Future.delayed()`. Describe a real Flutter app feature where you would need to actually await a real asynchronous operation — not just a simulated delay. What would the Future resolve to, and what would happen to the UI while the user was waiting?**

A real Flutter app feature that requires this is **fetching user profile data from a remote REST API** after logging in. 
- **What it resolves to:** The `Future` would resolve to an `http.Response` object containing JSON data, which would then be parsed into a `UserProfile` model object.
- **UI State:** While the user is waiting, the UI would typically show a loading indicator (like a `CircularProgressIndicator` or a shimmer loading skeleton) using a `FutureBuilder` or state management package. Once the data arrives, the widget rebuilds to display the user's name and avatar.

**QR4. If a colleague asked you: "Why not just use a single function that takes the operation name as a parameter, rather than writing separate `add()`, `subtract()`, `multiply()`, and `divide()` methods?" — what would you say? Are there advantages to both approaches?**

I would explain that writing separate methods like `add()` and `subtract()` provides much **better type safety, clearer method signatures, and IDE autocompletion**. With separate methods, the code clearly documents what operations are available. It also strictly isolates logic for cleaner testing and exception handling (for example, the `DivisionByZeroException` is only relevant to `divide()`). 

- **Advantages of a single function (e.g. `calculate('add', a, b)`):** It can result in fewer lines of code initially and a more centralized method structure. However, "magic string" parameters are prone to typos, and any unexpected operator might result in an unhandled case.
- **Advantages of separate methods:** It adheres closely to the **Single Responsibility Principle**, is much more readable at the call site (`calc.add(2, 2)` vs `calc.calculate('add', 2, 2)`), and scales better if one operation later requires more complex or distinct logic than the others.
