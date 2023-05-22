abstract class Account {
  late int accountNumber;
  late double balance;

  Account(this.accountNumber, this.balance);

  /// Adds the specified amount to the account balance.
  void deposit(double amount) {
    balance += amount;
  }

  withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(super.accountNumber, super.balance, this.interestRate);

  /// Subtract the specified amount from the account balance.
  /// Apply the interest rate to the remaining balance.
  @override
  withdraw(double amount) {
    if (super.balance >= amount) {
      super.balance -= amount;
      super.balance += super.balance * (interestRate) / (100);
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(super.accountNumber, super.balance, this.overdraftLimit);

  ///Implement the withdraw() method in the CurrentAccount class as follows:
  /// Allow withdrawals up to the overdraft limit.
  ///If the withdrawal amount exceeds the overdraft limit, print a message indicating
  // insufficient funds.
  double totalAmountWithDraw = 0;

  @override
  withdraw(double amount) {
    totalAmountWithDraw += amount;
    if (totalAmountWithDraw <= overdraftLimit) {
      super.balance -= amount;
    } else {
      print("Insufficient funds");
    }
  }
}

void main() {
  Account savingAccountOfAmin = SavingsAccount(157896, 50000036.9, 6.23);
  savingAccountOfAmin.deposit(63360.65);
  print("After deposit: ${savingAccountOfAmin.balance}");
  savingAccountOfAmin.withdraw(12693.36);
  print("Withdraw and apply interest rate ${savingAccountOfAmin.balance}");

  Account currentAccountOfAmin = CurrentAccount(1589453, 250000.14, 10000.36);
  currentAccountOfAmin.deposit(25963.86);
  print("After deposit : ${currentAccountOfAmin.balance}");
  currentAccountOfAmin.withdraw(5693.6);
  print("After Withdraw : ${currentAccountOfAmin.balance}");
}
