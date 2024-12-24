#pragma version ^0.4.0
# @license MIT

struct Person:
    favorite_number: uint256
    name: String[100]

my_name: String[100]
my_favorite_number: uint256 # 0 as a default number
owner: public(address)

list_of_numbers: public(uint256[5])
index: public(uint256)

@deploy 
def __init__():
    self.owner = msg.sender
    self.my_favorite_number = 69
    self.index = 0

@external
def setNum(_newFavNumber: uint256):
    self.my_favorite_number = _newFavNumber


@external 
@view
def retrieve() -> uint256:
    return self.my_favorite_number


@external
def add_number(favorite_number: uint256):
    self.list_of_numbers[self.index] = favorite_number
    self.index++ # or self.index = self.index + 1