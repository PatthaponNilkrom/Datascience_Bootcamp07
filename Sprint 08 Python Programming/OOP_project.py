# Python Project: create new ATM class
from random import sample , randint
class ATM:
    def __init__(self, name, bank, balance, pin = 1234):
        self.name = name
        self.bank = bank
        self.balance = balance
        self.pin = pin
        self.keep = []
        
    def deposit(self):
        user_pin = int(input("Please enter pin: "))
        if user_pin == self.pin:
            amt = int(input("Amount to deposit: "))
            self.balance += amt
            tt = (f"deposit {amt} baht remaining {self.balance} baht")
            self.keep.append(tt) 
            return tt
        else:
            print("incorrect, please enter pin again.")
            
    def withdraw(self):
        user_pin = int(input("Please enter pin: "))
        if user_pin == self.pin:
            amt = int(input("Amount to withdraw: "))
            if amt > self.balance:
                        print("insufficient balance!!!")
            else:
                self.balance -= amt
                tt = (f"deposit {amt} baht remaining {self.balance} baht")
                self.keep.append(tt) 
                return tt
        else:
            print("incorrect, please enter pin again.")
            
    def otp(self):
        user_pin = int(input("Please enter pin: "))
        if user_pin == self.pin:
            self.ran = randint(1000,9999)
            print(self.ran)
        else:
            print("incorrect, please enter pin again.")
            
    def transfer(self):
        user_pin = int(input("Please enter pin: "))
        if user_pin == self.pin:
            print("Please enter OTP, enter 0 to exit")
            while True:
                user_input = int(input("OTP: "))
                if user_input == 0:
                    break
                elif user_input == self.ran:
                    amt = int(input("Amount to transfer: "))
                    if amt > self.balance:
                        print("insufficient balance!!!")
                    else:
                        self.balance -= amt
                        tt = (f"transfer {amt} baht remaining {self.balance} baht")
                        self.keep.append(tt) 
                        return tt
                else:
                    print("incorrect, please enter OTP again.")
        else:
            print("incorrect, please enter pin again.")  
            
    def transaction(self):
        user_pin = int(input("Please enter pin: "))
        if user_pin == self.pin:
            print(f"name: {self.name} \nbank: {self.bank} \nremaining: {self.balance} \ntransaction {self.keep}")
        else:
            print("incorrect, please enter pin again.")
