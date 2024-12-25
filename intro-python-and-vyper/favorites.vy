#pragma version ^0.4.0
# @license MIT

struct Person:
    favorite_number: uint256
    name: String[100]

my_name: public(String[100])
my_favorite_number: uint256 # 0 as a default number
owner: public(address)

list_of_numbers: public(uint256[5])
list_of_people: public(Person[5])
index: public(uint256)

name_to_favorite_number: public( HashMap[String[100], uint256] )

@deploy 
def __init__():
    self.owner = msg.sender
    self.my_favorite_number = 69
    self.index = 0
    self.my_name = "Rianzi"

@external
def setFavNum(_newFavNumber: uint256):
    self.my_favorite_number = _newFavNumber


@external 
@view
def myFavNum() -> uint256:
    return self.my_favorite_number


@external
def add_person(name: String[100], favorite_number: uint256):
    # Add favorite number to the numbers of list
    self.list_of_numbers[self.index] = favorite_number

    # Add the person to the person's list
    new_person: Person = Person(favorite_number = favorite_number, name = name)
    self.list_of_people[self.index] = new_person

    # Add the person to the hashMap or mapping
    self.name_to_favorite_number[name] = favorite_number


    self.index = self.index + 1