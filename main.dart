void main() {
  Person person = Person("abdo", 21);
  Kia kia = Kia("Kia", "Sportage", 2020, "Red");
  Honda honda = Honda("Honda", "Civic", 2021, "Blue");

  kia.display_info();
  honda.display_info();

}

class Person {
  String _name;
  int _age;

  Person(this._name, this._age);

  void introduce() {
    print('My name is $name and I am $age years old.');
  }
  setName(String name) {
    _name = name;
  }
  setAge(int age) {
    _age = age;
  }
  String get name => _name;
  int get age => _age;
}


class Mohand extends Person {
  Mohand(String name, int age) : super(name, age);

  @override
  void introduce() {
    print('My name is $name and I am $age years old. I am a Mohand.');
  }
}


class Car {
  String? brand;
  String? model;
  int? year;

  Car(this.brand, this.model, this.year);
  void display_info() {
    print("Car brand :$brand , Model: $model , Year: $year");
  }
}

class Honda extends Car {
  String? color;
  Honda(String brand, String model, int year, this.color) : super(brand, model, year);

  @override
  void display_info() {
    super.display_info();
    print("Car color for honda: $color");
  }
}


class Kia extends Car {
  String? color;
  Kia(String brand, String model, int year, this.color) : super(brand, model, year);

  @override
  void display_info() {
   super.display_info();
    print("Car color kia: $color");
  }
}




 
