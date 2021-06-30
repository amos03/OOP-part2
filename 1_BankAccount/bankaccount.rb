class BankAccount
    @@interest_rate=0.5
    @@accounts=[]
    @@total_balance=0

    def initialize
        @balance = 0
    end

    attr_accessor :balance

    def deposit (deposit_amount)
        @balance +=deposit_amount
        @@total_balance +=deposit_amount
    end

    def withdraw (withdraw_amount)
        @balance -=withdraw_amount
        @@total_balance -=withdraw_amount
    end

    #class method
    def self.create
        new_account = BankAccount.new
        @@accounts << new_account
        return new_account
    end


    def self.total_funds
        return @@total_balance
    end  
    
    def self.interest_time
        @@accounts.each do |account|
            @@total_balance += account.balance * @@interest_rate * 0.01
            account.balance += account.balance * @@interest_rate * 0.01
        # note the order above: first do the total balance THEN the account balances; otherwise there will be another percentage compounded onto total balance, since account balance will already have been increased
        end
    end
end

my_account=BankAccount.create
your_account=BankAccount.create
p my_account.balance
p BankAccount.total_funds
my_account.deposit(200)
your_account.deposit(1000)
p my_account.balance
p your_account.balance
p BankAccount.total_funds
BankAccount.interest_time
p my_account.balance
p your_account.balance
puts BankAccount.total_funds
my_account.withdraw(50)
puts my_account.balance
puts BankAccount.total_funds
