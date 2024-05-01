# string-calculator-tdd

## Getting Started

This demonstrates the String calculator class with TDD, that follows conditions -

### Requirements

1. Allow the add method to handle an any amount of numbers.

2. Allow the add method to handle new lines between numbers (instead of commas).

  ```bash
  The following input is valid: "1\n2,3" (will return 6)
  The following input is invalid: "1,\n"
  ```

3. Support different delimiters<br>
  To change delimiter, the beginning of the string will contain a separate line that looks like this: "//[delimiter]\n[numbers…]".
  > "//;\n1;2" here the delimiter is ";" and this should return 3.

4. Calling add with a negative number will throw an exception "negative numbers not allowed <negative_number>".<br>
  If there are multiple negative numbers, show all of them in the exception message, separated by commas

### Testing

1. Run test cases -

  ```bash
  ruby string_calculator_test.rb
  ```

2. Run specific test -

  ```bash
  ruby -w string_calculator_test.rb --name test_for_empty_string
  ```
