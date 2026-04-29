void main(List<String> args) {
  // Person person1 = Person(name: 'Bob', age: 20); // 创建Person类的实例
  // person1.study(); // 调用实例的方法
  // Person person2 = Person(name: 'Alice', age: 25);
  // person2.study();
  // Person person3 = Person.editName(name: 'Charlie');
  // person3.study();

  // Person student1 = Student(name: 'Tom');
  // student1.study();

  // PayBase wxpay = WxPay();
  // wxpay.pay();
  // PayBase alipay = AliPay();
  // alipay.pay();

  Father father = Father(name: '爸爸');
  father.song(father.name!);
  Mother mother = Mother(name: '妈妈');
  mother.song(mother.name!);
}

// class 类名 { 属性 方法 }
class Person {
  String? name = ''; // 属性
  int? age = 0;
  String? sex = '男';

  // 默认构造函数
  // Person({String? name, int? age, String? sex}) {
  //   this.name = name;
  //   this.age = age;
  //   this.sex = sex;
  // }
  Person({this.name, this.age, this.sex}); // 默认构造函数(语法糖)

  // 命名构造函数
  // Person.editName({String? name}) {
  //   this.name = name;
  // }
  Person.editName({this.name}); // 命名构造函数(语法糖)

  // 默认构造函数和命名构造函数可以同时存在

  // 方法
  void study() {
    print('$name正在学习');
  }
}

// 继承，子类Student继承父类Person，拥有父类的属性和方法
class Student extends Person {
  Student({String? name, int? age, String? sex})
    : super(name: name, age: age, sex: sex); // 调用父类的构造函数

  @override
  void study() {
    // super.study(); // 先调用了父类的方法
    print('$name正在课上吃辣条');
  }
}

// 基础支付类，多态(继承+方法重写)，父类PayBase定义了一个pay方法，子类WxPay和AliPay重写了pay方法，实现了不同的支付方式
// class PayBase {
//   void pay() {
//     print('支付');
//   }
// }

// class WxPay extends PayBase {
//   @override
//   void pay() {
//     print('微信支付');
//   }
// }

// class AliPay extends PayBase {
//   @override
//   void pay() {
//     print('支付宝支付');
//   }
// }

// 抽象类，抽象类不能被实例化，只能被继承，抽象方法没有方法体，子类必须实现抽象方法
abstract class PayBase {
  void pay(); // 抽象方法，没有方法体，子类必须实现这个方法
}

class WxPay implements PayBase {
  @override
  void pay() {
    print('微信支付');
  }
}

class AliPay implements PayBase {
  @override
  void pay() {
    print('支付宝支付');
  }
}

// 定义一个混入对象
mixin SongBase {
  void song(String name) {
    print('$name在唱歌');
  }
}

class Father with SongBase {
  String? name;
  int? age;
  Father({this.name, this.age});
}

class Mother with SongBase {
  String? name;
  int? age;
  Mother({this.name, this.age});
}
