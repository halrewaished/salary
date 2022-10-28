import 'dart:io';
void main() {
  print("Please enter your salary: "); // Text
  int salary = int.parse(stdin.readLineSync()!); //TextField
  User user = new User(salary);
  print("Please enter your expense: ");// Text
  int expense = int.parse(stdin.readLineSync()!);//TextField
  user.expenses(expense);
}
class User {
  int? salary ;
  int? balance;


  User(int salary) {
    this.salary = salary;
    this.balance = this.salary!;
  }


  int? get currSalary {
    return salary;
  }
  void currBalance(int newBalance) {
    this.balance = newBalance;
    print("your salary is: ${this.salary}");
    print("The balance after expense: ${this.balance}");
  }
  void expenses(int expense) {
    int x = this.balance! - expense;
    print("this is from expense function:  $x");
    currBalance(x);
  }
}
