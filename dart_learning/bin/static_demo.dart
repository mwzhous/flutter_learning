// class Person {
//   static String name = '张三';
//
//   static void show() {
//     print(name);
//   }
// }
//
// main() {
//   print(Person.name);
//   Person.show();
// }

// class Person {
//   static String name = '张三';
//   int age = 20;
//
//   static void show() {
//     print(name);
//   }
//
//   void printInfo() {
//     // 非静态方法可以访问静态成员以及非静态成员
//     print(name); // 访问静态属性
//     print(age); // 访问非静态属性
//     show(); // 调用静态方法
//   }
//
//   static void printUserInfo() {
//     // 静态方法
//     print(name); // 静态属性
//     show(); // 静态方法
//     // print(this.age); // 静态方法没法访问非静态的属性
//     // this.printInfo(); // 静态方法没法访问非静态的方法
//   }
// }
//
// void main() {
//   print(Person.name);
//   Person.show();
//
//   Person p = Person();
//   p.printInfo();
//
//   Person.printUserInfo();
// }

class Person {
  String name;
  num age;

  Person(this.name, this.age);

  void printInfo() {
    print("$name---$age");
  }
}

void main() {
  Person p = Person('张三', 20);
  p.printInfo();

  Person p1 = Person('张三', 20);
  if (p1 is Person) {
    p1.name = "李四";
  }
  p1.printInfo();
  print(p1 is Object);

  Person p2 = Person('张三111', 20);
  p2.printInfo();
  p2.name = '张三222';
  p2.age = 40;
  p2.printInfo();

  Person p3 = Person('张三', 20);
  p3.printInfo();
  p3
    ..name = "李四"
    ..age = 30
    ..printInfo();
}