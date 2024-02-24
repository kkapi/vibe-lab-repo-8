class Animal {
  var name: String
  var color: String
  var age: Int

  init(name: String, color: String, age: Int) {
    self.name = name
    self.color = color
    self.age = age
  }
}

class Dog : Animal {
  var nickname: String

  init(name: String, color: String, age: Int, nickname: String) {
    self.nickname = nickname
    super.init(name: name, color: color, age: age)
  }
}

class Pig : Animal {
  var weigth: Int

  init(name: String, color: String, age: Int, weigth: Int) {
    self.weigth = weigth
    super.init(name: name, color: color, age: age)
  }
}

class House {
  var width: Double
  var height: Double
  
  init(width: Double, height: Double) {
      self.width = width
      self.height = height
  }
  
  func create() {
      let area = width * height
      print("Площадь дома: \(area)")
  }
  
  func destroy() {
      print("Дом уничтожен")
  }
}

class Student {
  var student: [String]
  
  init(student: [String]) {
      self.student = student
  }
  
  func sordBySymbolsADS() -> [String] {
      return student.sorted()
  }
  
  func sordBySymbolsDESC()-> [String] {
      return student.sorted { (a: String, b: String) -> Bool in return a > b}
  }
  
  func sordByCountSymbolsADS() -> [String] {
      return student.sorted { (a: String, b: String) -> Bool in return a.count < b.count}
  }
  
  func sordByCountSymbolsDESC() -> [String] {
      return student.sorted { (a: String, b: String) -> Bool in return a.count > b.count}
  }
}

struct Car {
  var brand: String
  var model: String
  var year: Int
}

class Person {
  var name: String
  var age: Int

  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }

  func sayHi() {
    print("Hi" + name)
  }
}

// 1. Структуры - это значения, классы - это ссылки
// 2. Структуры передаются по значению, классы передаются по ссылке
// 3. Структуры не могут наследоваться, классы могут наследоваться

var carts: Dictionary<Int, String> = [:]
for i in 0...8 {
    carts.updateValue(String(i+1) + " Пики", forKey: i)
}
carts.updateValue("Валет Пики", forKey: 9)
carts.updateValue("Дама Пики", forKey: 10)
carts.updateValue("Король Пики", forKey: 11)
carts.updateValue("Туз Пики", forKey: 12)
for i in 13...21 {
    carts.updateValue(String(i-12) + " Буби", forKey: i)
}
carts.updateValue("Валет Буби", forKey:22)
carts.updateValue("Дама Буби", forKey: 23)
carts.updateValue("Король Буби", forKey: 24)
carts.updateValue("Туз Буби", forKey: 25)
for i in 26...34 {
    carts.updateValue(String(i-25) + " Крести", forKey: i)
}
carts.updateValue("Валет Крести", forKey: 35)
carts.updateValue("Дама Крести", forKey: 36)
carts.updateValue("Король Крести", forKey: 37)
carts.updateValue("Туз Крести", forKey: 38)
for i in 39...47 {
    carts.updateValue(String(i-38) + " Черви", forKey: i)
}
carts.updateValue("Валет Черви", forKey: 48)
carts.updateValue("Дама Черви", forKey: 49)
carts.updateValue("Король Черви", forKey: 50)
carts.updateValue("Туз Черви", forKey: 51)

var combinate: [Int] = [0,0,0,0,0]

print("Карты на столе:")

var randomNumber: Int
for i in 0...4 {
    repeat {
        randomNumber = Int.random(in: 0..<52)
    } while combinate.contains(randomNumber)
    combinate[i] = randomNumber
    print(carts[combinate[i]]!)
}

combinate.sort()

print(check(combinate))

func check(_ combinate: [Int]) -> String {

if combinate == [47, 48, 49, 50, 51] || combinate == [34, 35, 36, 37, 38] || combinate == [21, 22, 23, 24, 25] || combinate == [8, 9, 10, 11, 12] {
    return "Ваша комбинация - флеш рояль"
}
for i in 0...4 {
  if combinate[0] == combinate[i]-i && combinate[i] != 13 && combinate[i] != 26 && combinate[i] != 39 {
      if i == 4 {
          return "Ваша комбинация - стрит флеш"
      }
  } else
  {
      break
  }
}
var amount = 0
for i in 1...4 {
  if combinate[i] == combinate[i-1] + 13 {
     amount = amount + 1
  } else
  {
  if amount != 3 {
   amount = 0
   }
  }
}
if amount == 3 {
   return "Ваша комбинация - каре"
}

var combinateCopy: [Int] = [0,0,0,0,0]
for i in 0...4 {
    combinateCopy[i] = combinate[i] % 13
}

if combinateCopy[0] == combinateCopy[1] && combinateCopy[1] == combinateCopy[2] && combinateCopy[3] == combinateCopy[4] {
   return "Ваша комбинация - фулл хаус"
}

if combinateCopy[0] == combinateCopy[1] && combinateCopy[2] == combinateCopy[3] && combinateCopy[3] == combinateCopy[4] {
   return "Ваша комбинация - фулл хаус"
}

amount = 0
for i in 0...4 {
    if combinate[i] <= 12 {
        amount = amount + 1
    }
}
if amount != 5 {
    amount = 0
}
for i in 0...4 {
    if combinate[i] >= 13 && combinate[i] <= 25 {
        amount = amount + 1
    }
}
if amount != 5 {
    amount = 0
}
for i in 0...4 {
    if combinate[i] >= 26 && combinate[i] <= 38 {
        amount = amount + 1
    }
}
if amount != 5 {
    amount = 0
}
for i in 0...4 {
    if combinate[i] >= 39 {
        amount = amount + 1
    }
}
if (amount == 5) {
   return "Ваша комбинация - флеш"
}
for i in 0...4 {
  if combinateCopy[0] == combinateCopy[i]-i && combinateCopy[i] != 13 && combinateCopy[i] != 26 && combinateCopy[i] != 39 {
      if i == 4 {
         return "Ваша комбинация - стрит"
      }
  } else
  {
      break
  }
}

if combinateCopy[0] == combinateCopy[1] && combinateCopy[1] == combinateCopy[2] {
   return "Ваша комбинация - тройка"
}

if combinateCopy[2] == combinateCopy[3] && combinateCopy[3] == combinateCopy[4] {
   return "Ваша комбинация - тройка"
}

if combinateCopy[0] == combinateCopy[1] && combinateCopy[2] == combinateCopy[3] {
    return "Ваша комбинация - две пары"
}
if combinateCopy[0] == combinateCopy[1] && combinateCopy[3] == combinateCopy[4] {
    return "Ваша комбинация - две пары"
}
if combinateCopy[1] == combinateCopy[2] && combinateCopy[3] == combinateCopy[4] {
    return "Ваша комбинация - две пары"
}

if combinateCopy[0] == combinateCopy[1] {
    return "Ваша комбинация - пара"
}
if combinateCopy[1] == combinateCopy[2] {
    return "Ваша комбинация - пара"
}
if combinateCopy[2] == combinateCopy[3] {
    return "Ваша комбинация - пара"
}
if combinateCopy[3] == combinateCopy[4] {
    return "Ваша комбинация - пара"
}

return "Ваша комбинация - старшая карта"
}
