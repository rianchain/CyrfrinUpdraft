#pragma version ^0.4.0
# @license MIT

my_favorite_number: uint16 # 0 as a default number
owner: public(address)

@deploy 
def __init__():
    self.owner = msg.sender


@external
def setNum(_newFavNumber: uint16):
    self.my_favorite_number = _newFavNumber


@external 
@view
def retrieve() -> uint16:
    return self.my_favorite_number