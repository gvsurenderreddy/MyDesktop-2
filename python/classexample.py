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

    def increase(self):
        """TODO: Docstring for increase.

        :rate: TODO
        :returns: TODO

        """
        self.money = self.money * (1 + self.rate / 100.0)


if __name__ == "__main__":
    name = raw_input("enter name: ")
    acc = input("enter acc: ")
    money = input("enter money: ")
    myAcc = BankAccount(name, acc, money)
    myAcc.show()
    deposit = input("enter money to deposit: ")
    myAcc.deposit(deposit)
    myAcc.show()
    draw = input("enter money to draw: ")
    myAcc.draw(draw)
    myAcc.show()

    rate = input("enter rate: ")
    myInterest = InterestAccount(name, acc, money, rate)
    myInterest.increase()
    myInterest.show()
