# Dependency inversion principle

# Dependency inversion_1.py 에서
# Zoo -> 의존 -> Cat, Dog ... 하던 것이
# Zoo -> 의존 -> Animal <- 의존 <- Cat, Dog ...
# 이와 같이 바뀌면 Sheep, Cow 등 low-level module들이 추가되더라도
# Zoo는 변경할 필요가 없음.
class Animal: # Abstract layer
    def speak(self):
        pass
    
class Cat(Animal):
    def speak(self):
        print("meow")
        
class Dog(Animal):
    def speak(self):
        print("bark")
        
class Zoo:
    def __init__(self):
        self.animals = []
    
    # Cat, Dog에 대해서는 모르고 Animal 클래스에만 dependency를 가지고 있음.
    def addAnimal(self, animal: Animal):
        self.animals.append(animal)
        
    def speakAll(self):
        for animal in self.animals:
            animal.speak()
            
zoo = Zoo()
zoo.addAnimal(Cat())
zoo.addAnimal(Dog())
zoo.speakAll()