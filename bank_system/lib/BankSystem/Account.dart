class BankAccount {
  late int id;
  double balance;
  static int nextid = 0;
  BankAccount({this.balance = 0}) {
    nextid++;
    id = nextid;
  }
  void withdraw(double money) {
    if (money < 0) {
      print('please enter a valid number ');
      return;
    }

    if (money <= balance) {
      balance -= money;
      print('operation done your balance is $balance');
    } else {
      print('you don\'t have that amount of money');
    }
  }

  void deposit(double money) {
    if (money < 0) {
      print('please enter a valid number ');
      return;
    }
    balance += money;
    print('operation done your balance is $balance');
  }

  void viewDetails() {
    print('id: $id');
    print('balance: $balance');
  }
}

class SavingsBankAccount extends BankAccount {
  static int minimum_balance = 1000;
  SavingsBankAccount({super.balance}) {
    if (balance < minimum_balance) {
      print('initial balance should be more that $minimum_balance');
    }
  }
  @override
  void withdraw(double money) {
    if (money < 0) {
      print('please enter a valid number ');
      return;
    }

    if (money < balance && (balance - money) > minimum_balance) {
      balance -= money;
      print('operation done your balance is $balance');
    } else {
      print('you don\'t have that amount of money');
    }
  }

  @override
  void deposit(double money) {
    if (money < 0) {
      print('please enter a valid number ');
      return;
    }
    if (money >= 100) {
      balance += money;
      print('operation done your balance is $balance');
    } else {
      print('you need more money to deposit');
    }
  }

  @override
  void viewDetails() {
    print('balance: $balance');
    print('id: $id');
  }
}

void main() {}
