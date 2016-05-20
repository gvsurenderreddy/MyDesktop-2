#!/usr/bin/env python
# -- coding: utf-8 --


class BankAccount():

    """Docstring for BankAccount. """

    def __init__(self, name, number, money):
        """TODO: to be defined1.

        :name: TODO
        :number: TODO
        :money: TODO

        """

        self.name = name
        self.number = number
        self.money = money

    def show(self):
        """TODO: Docstring for show.

        :returns: TODO

        """
        print "Now %s has $%.2f" % (self.name, self.money)

    def draw(self, money):
        """TODO: Docstring for draw.

        :money: TODO
        :returns: TODO

        """
        if money < self.money:
            self.money -= money
        else:
            print "Not enough money!"

    def deposit(self, money):
        """TODO: Docstring for deposit.

        :money: TODO
        :returns: TODO

        """
        self.money += money


class InterestAccount(BankAccount):

    """Docstring for InterestAccount. """

    def __init__(self, name, number, money, rate):
        """TODO: to be defined1.

        :rate: TODO

        """
        BankAccount.__init__(self, name, number, money)

        self.rate = rate

    def summ(self):
        """TODO: Docstring for summ.

        :rate: TODO
        :returns: TODO

        """
        self.money = self.money*(1+self.rate/100)


if __name__ == "__main__":
    name = raw_input("enter name: ")
    acc = int(raw_input("enter acc: "))
    money = float(raw_input("enter money: "))
    myAcc = BankAccount(name, acc, money)
    myAcc.show()
    deposit = float(raw_input("enter money to deposit: "))
    myAcc.deposit(deposit)
    myAcc.show()
    draw = float(raw_input("enter money to draw: "))
    myAcc.draw(draw)
    myAcc.show()

    rate = float(raw_input("enter rate: "))
    myInterest = InterestAccount(name, acc, money, rate)
    myInterest.summ()
    myInterest.show()
