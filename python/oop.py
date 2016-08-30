# local state by using dictionary
# global methods

# def make_account():
#     return {'balance':0}

# def deposit(account, amount):
#     account['balance'] += amount
#     return account['balance']

# def withdraw(account, amount):
#     account['balance'] -= amount
#     return account['balance']

# x = make_account()
# y = make_account()

# print deposit(x, 100)
# print deposit(y, 50)
# print withdraw(x, 10)
# print withdraw(y,10)

# Use of Class (OOP way) / Objects
class BankAccount:
    def __init__(self):
        self.balance = 0

    def withdraw(self, amount):
        self.balance -= amount
        return self.balance

    def deposit(self, amount):
        self.balance += amount
        return self.balance

# x = BankAccount()
# y = BankAccount()
# print x.deposit(100)
# print y.deposit(50)
# print x.withdraw(10)
# print y.withdraw(5)

# Inheritance
class MinimumBalanceAccount(BankAccount):
    def __init__(self, minimum_balance):
        BankAccount.__init__(self)
        self.minimum_balance = minimum_balance

    def withdraw(self, amount):
        if self.balance - amount < self.minimum_balance:
            print "Sorry, minimum balance must be maintained."
        else:
            BankAccount.withdraw(self, amount)

x = BankAccount()
xmin = MinimumBalanceAccount(x)

x.deposit(100)
x.withdraw(10)
x.withdraw(60)

print x.balance
print xmin.balance


