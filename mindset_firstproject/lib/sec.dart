




void main() {
  
 
}


class BankAccount {
  String accountNumber;
  String accountHolderName;
  double balance;

  BankAccount({
    required this.accountNumber,
    required this.accountHolderName,
    required this.balance,
  });

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("Deposited: \$${amount.toStringAsFixed(2)}");
    } else {
      print("Deposit amount must be positive.");
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      print("Withdrawn: \$${amount.toStringAsFixed(2)}");
    } else {
      print("Invalid withdrawal amount.");
    }
  }

  void displayBalance() {
    print("Current balance: \$${balance.toStringAsFixed(2)}");
  }
}