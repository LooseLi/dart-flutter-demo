void main(List<String> args) {
  // Future 类似 js 中的 Promise

  // Future f = Future(() {
  //   return 'Hello, Future!';
  // });
  // f.then((value) {
  //   print(value);
  // });
  // f.catchError((error) {
  //   print('Error: $error');
  // });

  // Future f = Future(() {
  //   return 'Hel';
  // });
  // f
  //     .then((value) {
  //       return value + 'lo!';
  //     })
  //     .then((value) {
  //       print(value);
  //     })
  //     .catchError((error) {
  //       print('Error: $error');
  //     });

  test();
}

void test() async {
  try {
    // await Future(() {
    //   return 'Future';
    // });
    print('test1');
    String s = await Future.delayed(Duration(seconds: 1), () {
      return 'Future';
    });
    print('test2');
    print('s: $s');
  } catch (e) {
    print('Error: $e');
  }
}
