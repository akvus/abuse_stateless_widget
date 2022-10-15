void main() {}

abstract class Animal {
  void move();

  String get name => "Animal";
}

abstract class Dog extends Animal {}

class ExtendedDog extends Animal {
  @override
  void move() {
    // TODO: implement move
  }
}

class X {
  void y() {}
}

class ImplemetedDog implements Dog, Animal, X {
  @override
  void move() {
    // TODO: implement move
  }

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  void y() {
    // TODO: implement y
  }
}
