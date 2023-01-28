# Open closed principle
# 소프트웨어 객체(클래스, 모듈, 함수 등)는 확장에 열려 있어야 하고, 수정에 대해서는 닫혀 있어야 함.

# Open closed principle 준수
class Animal:
    def speak(self):
        pass
    
class Cat(Animal):
    def speak(self):
        print("meow")
        
class Dog(Animal):
    def speak(self):
        print("bark")
        
def hey(animal: Animal):
    animal.speak()
    
kitty = Cat()
bingo = Dog()

hey(kitty)
hey(bingo)