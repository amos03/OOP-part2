class BankAccount
    @@interest_rate=0.5
    @@accounts=[]

    def initialize
        @balance = 0
    end

    attr_accessor :balance

    def deposit (deposit_amount)
        @balance +=deposit_amount
    end

    def withdraw (withdraw_amount)
        @balance -=withdraw_amount
    end

    #class method
    def self.create
        new_account = BankAccount.new
        @@accounts << new_account
        return new_account
    end

    def self.total_funds
        @@accounts.each do |account|
            return total_balance +=account.balance  
        end
    end
end

my_account=BankAccount.create
your_account=BankAccount.create
p my_account.balance
