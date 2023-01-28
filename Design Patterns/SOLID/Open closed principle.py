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