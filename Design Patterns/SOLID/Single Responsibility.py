# Single Responsibility principle
# 모든 함수나 클래스는 하나의 책임만을 가지며, 클래스는 그 책임을 완전히 캡슐화해야 함.

# Single Responsibility principle을 준수하지 않는 클래스
class NonComplianceCat:
    def __init__(self, age, name):
        self.age = age
        self.name = name
        
    def eat(self, food):
        pass
    
    def walk(self):
        pass
    
    def speak(self):
        pass
    
    # print나 log를 남기는 기능을 Cat class에 어울리지 않는 기능.
    def print(self):
        print(f"age: {self.age}\nname: {self.name}")
        
nonComplianceCat = NonComplianceCat(5, "Navi")
nonComplianceCat.print()

# Single Responsibility principle을 준수
# Cat과 관련된 함수만 존재
class Cat:
    def __init__(self, age, name):
        self.age = age
        self.name = name
        
    def eat(self, food):
        pass
    
    def walk(self):
        pass
    
    def speak(self):
        pass
    
    def repr(self):
        return f"age: {self.age}\nname: {self.name}"
    
cat = Cat(3, "Yeolmok")
print(cat.repr())