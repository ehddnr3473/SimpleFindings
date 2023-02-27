# Dependency inversion principle

# Low-level module
class Cat:
    def speak(self):
        print("meow")
        
class Dog:
    def speak(self):
        print("bark")

class Sheep:
    def speak(self):
        pass

class Cow:
    def speak(self):
        pass
    
# High-level module
# Cat, Dog, Sheep, Cow 등 많은 low-level modules의 dependency를 소유함.
# low-level module의 수가 증가함에 따라 코드의 수정 및 관리가 힘들어짐.
# 이를 해결하기 위해 Dependency inversion_2.py 처럼 수정해줄 수 있음.
class Zoo:
    def __init__(self):
        self.cat = Cat()
        self.dog = Dog()
        self.sheep = Sheep()
        self.cow = Cow()