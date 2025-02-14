import Foundation

// Defines method to be implemented for Accounts
protocol BankOperation{
    func deposit(_ amount: Double)
    func withdraw(_ amount: Double)
    func addInterest()
}
// Stores neccsary account information and enums for status of transactions
class Account: BankOperation{
    
    var balance: Double
    var accountNumber: Int
    var name: String
    var transactionHistory: [Transactions] = []
    
    init(name: String, balance: Double, accountNumber: Int) {
        self.name = name
        self.balance = balance
        self.accountNumber = accountNumber
    }
    
    enum Transactions {
        case deposit(amountToDeposit: Int, name: String, balance: Double)
        case withdraw(amountToWithdraw: Int, name: String, balance: Double)
        case addInterest(interestRate: Double, balance: Double, name: String)
        //case transfer(savingAccount)
    }
    
    func deposit(_ amount: Double){
       self.balance = balance + amount
        print(Transactions.deposit(amountToDeposit: Int(amount), name: self.name, balance: self.balance))
        transactionHistory.append(Transactions.deposit(amountToDeposit: Int(amount), name: self.name, balance: self.balance))
       print(balance)
   }
    
    func withdraw(_ amount: Double) {
       balance -= amount
        transactionHistory.append(Transactions.withdraw(amountToWithdraw: Int(amount), name: self.name, balance: self.balance))
        print(Transactions.withdraw(amountToWithdraw: Int(amount),name: self.name, balance: self.balance))
   }
    
    func getTransactionHistory() {
        transactionHistory.forEach { print("This is Transaction History: \($0) \n") }
    }

}
// adds defulat implementation for NonSaving accounts
extension BankOperation {
    
    func addInterest() {
        print("No Interest for this account \n")
    }
}

// has interest rate
class savingAccount: Account{
    var interestRate: Double
    
    init(name: String, balance: Double, accountNumber: Int,   interestRate: Double) {
        self.interestRate = interestRate
        super.init(name: name, balance: balance, accountNumber: accountNumber)
    }
    
    func addInterest() {
        balance = (balance * interestRate) + balance
        transactionHistory.append(Transactions.addInterest(interestRate: interestRate, balance: balance, name: self.name))
        print(Transactions.addInterest(interestRate: interestRate, balance: balance, name: self.name), terminator: "\n")
   }
}

class BankManager{
    
    var accounts: [Account] = []
    func addAccount(_ account:  [Account]){
        accounts.append(contentsOf: account)
    }
    
    func removeAccount(_ accountNumber: Int) {
        accounts.removeAll(where: {$0.accountNumber == accountNumber})
        print("Removed account with number \(accountNumber)")
    }
    
    func transfer(_ accountNumber1: Int, accountNumber2: Int) {
        let firstAccount = accounts.first(where: {$0.accountNumber == accountNumber1})
        let secondAccount = accounts.first(where: {$0.accountNumber == accountNumber2})
        let amountToBeTransfered = firstAccount?.balance;
        firstAccount?.withdraw(amountToBeTransfered ?? 0)
        secondAccount?.deposit(amountToBeTransfered ?? 0)
    }
    
    func depositInto(_ accountNumber: Int, depositAmount: Double){
        accounts.first(where: {$0.accountNumber == accountNumber})?.deposit(depositAmount)
        print("Deposited \(depositAmount) into account number \(accountNumber) \n")
    }
    
    func getTotal() -> Double{
        let total = accounts.reduce(0.0){$0 + $1.balance}
        print("The total of the accounts: \(total) \n")
        return total
    }
    
    func getAccounts() {
        accounts.forEach {
            print("\($0.name) Balance is: \($0.balance) for  Account Number \($0.accountNumber). \n")
            
        }
    }
        
}

// randomized accounts based on count var
var bankManager = BankManager()
let count = 70;

var accountsForTesting = Array(0..<count).map { index in
    let randomNames = ["Bill", "Bob", "Steve", "Mary", "Rash", "Isiah"]
    let randomName = randomNames.randomElement() ?? "User"
    let randomAccountNumber = Int.random(in: 100...1000)
    let randomBalance = floor(Double.random(in: 100...10000))
    if index % 2 == 0 {
        return Account(name: randomName , balance: randomBalance, accountNumber: randomAccountNumber)
    }
    else {
        let interest = floor(Double.random(in: 1.0...5.0))
        return savingAccount(name: randomName, balance: randomBalance, accountNumber: randomAccountNumber, interestRate: interest)
    }
}

bankManager.addAccount(accountsForTesting)
bankManager.getAccounts()
bankManager.getTotal( )
bankManager.depositInto(bankManager.accounts[Int.random(in: 0..<count)].accountNumber, depositAmount: floor(Double.random(in: 100...1000)))

let savingAccounts = bankManager.accounts.compactMap { $0 as? savingAccount }
savingAccounts.forEach { print("\($0.name) has an interest rate of \($0.interestRate) \n") }


let accounts = bankManager.accounts.compactMap { $0 as? savingAccount == nil ? $0 : nil }
accounts.forEach { print("\($0.name) has a balance of \($0.balance) with no interest \n") }

let selectedSavings = savingAccounts.randomElement()
bankManager.transfer(selectedSavings!.accountNumber ?? 0, accountNumber2: accounts.randomElement()?.accountNumber ?? 0)

selectedSavings?.addInterest()
selectedSavings?.getTransactionHistory()
bankManager.removeAccount(selectedSavings!.accountNumber ?? 0)
bankManager.getAccounts()

accounts.forEach {print($0.name); $0.addInterest()}
