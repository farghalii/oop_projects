import 'dart:io';
import 'Account.dart';

void main() {
  List<BankAccount> accounts =
  List.generate(10, (index) => BankAccount(balance: index * 20));

  int input;

  do {
    input = viewmenu();

    switch (input) {
      case 1:
        viewAllAccounts(accounts);
        break;
      case 2:
        search(accounts);
        break;
      case 3:
        withdraw(accounts);
        break;
      case 4:
        deposit(accounts);
        break;
      case 5:
        deleteAccount(accounts);
        break;
      default:
        print("happy to deal with you ");
    }
  } while (input != 6);
}

int viewmenu() {
  print('to view all accounts enter 1');
  print('to search for an account enter 2');
  print('to withdraw from an account enter 3');
  print('to deposit in an account enter 4');
  print('to delete an  account enter 5');
  print('to exit enter 6');
  int input = int.parse(stdin.readLineSync() ?? '6');
  return input;
}

void search(List<BankAccount> accounts) {
  print('enter account id');
  int id = int.parse(stdin.readLineSync()!);
  for (BankAccount item in accounts) {
    if (item.id == id) {
      item.viewDetails();
      print('======================================================');
      return;
    }
  }
  print("account doesn't exist");
  print('======================================================');
}

int searchIndex(List<BankAccount> accounts) {
  stdout.write('enter account id:  ');
  int id = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < accounts.length; i++) {
    if (accounts[i].id == id) {
      return i;
    }
  }
  return -1;
}

void viewAllAccounts(List<BankAccount> accounts) {
  for (BankAccount item in accounts) {
    item.viewDetails();
    print('======================================================');
  }
}

void withdraw(List<BankAccount> accounts) {
  int accountIndex = searchIndex(accounts);
  if (accountIndex == -1) {
    print('account does not exist');
    return;
  } else {
    print('enter the amount');
    double money = double.parse(stdin.readLineSync() ?? '0');
    accounts[accountIndex].withdraw(money);
  }
  print('======================================================');
}

void deposit(List<BankAccount> accounts) {
  int accountIndex = searchIndex(accounts);
  if (accountIndex == -1) {
    print('account does not exist');
    return;
  } else {
    print('enter the amount');
    double money = double.parse(stdin.readLineSync() ?? '0');
    accounts[accountIndex].deposit(money);
  }
  print('======================================================');
}

void deleteAccount(List<BankAccount> accounts) {
  int accountIndex = searchIndex(accounts);
  if (accountIndex == -1) {
    print('account does not exist');
    print('======================================================');
    return;
  } else {
    accounts.removeAt(accountIndex);
    print('account removed successfully');
    print('======================================================');
  }
}
