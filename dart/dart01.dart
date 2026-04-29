void main(List<String> args) {
  // var age = 28; // 变量var，第一次赋值后，不能再改变其类型
  // age += 1;
  // print(age);

  // const pi = 3.14; // 常量const，值不能改变，在编译时就确定了
  // print(pi);

  // final time = DateTime.now(); // 值不能改变，但在运行时才确定
  // print(time);

  // String name = 'Alice'; // 字符串类型，显式声明类型
  // name = 'Bob';
  // print(name);
  // String content = '我准备在${DateTime.now()}吃饭';
  // print(content);

  // /**
  //  * double和int不能直接赋值
  //  * num不能直接给double赋值
  //  * double可以直接给num赋值
  //  * 需要转化类型才能赋值
  //  */
  // int a = 10; // 整数类型
  // double b = 3.14; // 浮点数类型
  // num c = 2026; // 数字类型，可以是整数或浮点数
  // a += 7;
  // a = b.toInt();
  // c = a + b;
  // print('a: $a');
  // print('b: $b');
  // print('c: $c');

  // bool isTrue = true; // 布尔类型
  // isTrue = false;
  // print('isTrue: $isTrue');

  // List students = ['Alice', 'Bob', 'Charlie']; // 列表类型，元素可以是任何类型
  // students.add('David'); // 尾部添加元素
  // students.addAll(['Eve', 'David', 'Frank']); // 尾部添加多个元素
  // students.remove('David'); // 删除满足条件的第一个元素
  // students.removeLast(); // 删除最后一个元素
  // students.removeRange(0, 2); // 删除指定范围的元素，结束索引不包含
  // print('students: $students');
  // students.forEach((item) {
  //   print('forEach: $item'); // forEach方法，遍历列表中的每个元素
  // });
  // bool isAllC = students.every((item) {
  //   return item.toString().startsWith('C'); // every方法，判断列表中的每个元素是否满足条件
  // });
  // print('isAllC: $isAllC');
  // List filteredStudents = students.where((item) {
  //   return item.toString().startsWith('C'); // where方法，过滤列表中的元素，返回满足条件的元素组成的新列表
  // }).toList();
  // print('filteredStudents: $filteredStudents');
  // print(
  //   'students111: ${students.length} - ${students.last} - ${students.first} - ${students.isEmpty} - ${students.isNotEmpty}',
  // ); // 列表的属性

  // Map person = {
  //   'name': 'Alice',
  //   'age': 28,
  //   'isStudent': true,
  // }; // Map类型，键值对集合，键和值可以是任何类型
  // print('Map: ${person['name']}'); // 通过键访问值
  // person['age'] = 29; // 修改值
  // print('Map: ${person['age']}');
  // person.forEach((key, value) {
  //   print('Map forEach: $key - $value'); // forEach方法，遍历Map中的每个键值对
  // });
  // person.addAll({'year': '1999'}); // addAll方法，添加多个键值对
  // print('Map: $person');
  // print(person.containsKey('name')); // containsKey方法，判断Map中是否包含指定的键
  // person.remove('isStudent'); // remove方法，删除指定键的键值对
  // person.clear(); // clear方法，清空Map中的所有键值对
  // print('Map: $person');

  // dynamic free = 'I am free'; // dynamic类型，动态类型，可以改变类型
  // free = 100;
  // free = [];
  // free = {};
  // free = true;
  // print('dynamic: $free');

  // String? name = null; // ? 可空类型 表示变量可以是null
  // name?.startsWith('A'); // ?. 安全访问 表示如果name不为null，则调用startsWith方法，否则返回null
  // name!.startsWith('A'); // !. 非空断言 表示开发者认为name不为null，如果name为null，则抛出异常
  // String name2 = name ?? 'Unknown'; // ?? 空合并 表示如果name不为null，则使用name，否则使用'Unknown'

  // 算术运算符
  // double a = 233;
  // double b = 10;
  // print('+: ${a + b}'); // 加法
  // print('-: ${a - b}'); // 减法
  // print('*: ${a * b}'); // 乘法
  // print('/: ${a / b}'); // 除法，结果是double类型
  // print('~/ : ${a ~/ b}'); // 整除，结果是int类型
  // print('%: ${a % b}'); // 取余

  // 赋值运算符
  // double x = 10;
  // double y = 3;
  // print('x: ${x += y}');
  // print('x: ${x -= y}');
  // print('x: ${x *= y}');
  // print('x: ${x /= y}');

  // // 比较运算符
  // double a = 10;
  // double b = 20;
  // print('==: ${a == b}');
  // print('!=: ${a != b}');
  // print('>: ${a > b}');
  // print('<: ${a < b}');
  // print('>=: ${a >= b}');
  // print('<=: ${a <= b}');

  // // 逻辑运算符
  // bool x = true;
  // bool y = false;
  // print('&&: ${x && y}'); // 逻辑与
  // print('||: ${x || y}'); // 逻辑或
  // print('!: ${!x}'); // 逻辑非，取反

  // if () {
  // } else if () {
  // } else {
  // }

  // isTrue ? print('true') : print('false');

  // switch (expression) {
  //   case value1:
  //     // 代码逻辑1
  //     break;
  //   case value2:
  //     // 代码逻辑2
  //     break;
  //   default:
  //     // 默认逻辑
  // }

  // while (condition) {
  //  // 循环体
  //  break; // 退出整个循环
  //  continue; // 跳过当前循环，进入下一次循环
  // }

  // for (int i = 0; i < 10; i++) {
  //  // 循环体
  //  break; // 退出整个循环
  //  continue; // 跳过当前循环，进入下一次循环
  // }

  // --------------------------------------------------------------------

  // 有返回值：返回类型 函数名称 参数 函数体
  // 无返回值：void 函数名称 参数 函数体
  // 注意: 返回值类型可以省略，Dart会自动推断为 dynamic 类型，尽量不用
  // int add(int a, int b) {
  //   return a + b;
  // }
  // print(add(3, 7));
  // 可选位置参数必须位于必传参数后面，采用[]包裹
  // int add(int a, int b, [int c = 0]) {
  //   return a + b + c;
  // }
  // print(add(3, 7, 10));
  // 可选命名参数必须位于必传参数后面，采用{}包裹
  // int add(int a, int b, {int c = 0}) {
  //   return a + b + c;
  // }
  // print(add(3, 7, c: 10));

  // 匿名函数 Function 定义
  // Function add = (int a, int b) {
  //   return a + b;
  // };
  // // print(add(3, 7));
  // int test(Function callback) {
  //   int x = 12;
  //   int y = 11;
  //   return callback(x, y);
  // }
  // print(test(add));

  // 箭头函数
  // Function add = (int a, int b) => a + b; // 当函数体只有一行代码时，可以使用箭头函数，省略return和{}
  // print(add(3, 7));
  // int add(int a, int b) => a + b;

  // --------------------------------------------------------------------

  // 泛型
  // List<String> list = []; // 列表泛型
  // list.add('1');

  // Map<String, int> map = {}; // Map泛型
  // map['key'] = 1;

  // T getValue<T>(T value) {
  //   return value;
  // }
  // print(getValue<String>('test'));

  // void printList<T>(List<T> list) {
  //   list.forEach((item) {
  //     print('泛型列表: $item');
  //   });
  // }
  // printList<String>(['a', 'b', 'c']);

  // Student<String> student = Student();
  // student.name = 'Tom';
  // print('Student name: ${student.name}');
}

// class Student<T> {
//   T? name;
// }
