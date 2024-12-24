#pragma version ^0.4.0
# @license MIT

my_favorite_number: public(uint16) # 0 as a default number

@external
def setNum(_newFavNumber: uint16):
    self.my_favorite_number = _newFavNumber