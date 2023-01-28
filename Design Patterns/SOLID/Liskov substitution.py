# Liskov substitution principle
# 자료형 S가 자료형 T의 서브타입이라면 필요한 프로그램의 속성의 변경없이
# 자료형 T의 객체를 자료형 S의 객체로 교체(치환)할 수 있어야 함.

class Cat:
    def speak(self):
        print("meow")
        
class BlackCat(Cat):
    def speak(self):
        print("black meow")

class Fish(Cat):
    def speak(self):
        raise Exception("Fish cannot speak")

def speak(cat: Cat):
    cat.speak()

cat = Cat()
speak(cat)

cat = BlackCat()
speak(cat)

cat = Fish()
speak(cat)