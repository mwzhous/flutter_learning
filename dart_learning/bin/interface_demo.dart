abstract class Db {
  // 当做接口  接口就是约定、规范
  late String uri;  //数据库的链接地址
  add(String data);

  save();

  delete();
}

class MySQL implements Db {
  @override
  String uri;

  MySQL(this.uri);

  @override
  add(data) {
    print('这是 MySQL 的add方法，$data');
  }

  @override
  delete() {
    return null;
  }

  @override
  save() {
    return null;
  }

  remove() {}
}

class MsSQL implements Db {
  @override
  late String uri;

  @override
  add(data) {
    print('这是 MySQL 的add方法，$data');
  }

  @override
  delete() {
    return null;
  }

  @override
  save() {
    return null;
  }
}

main() {
  MySQL mySQL = MySQL('localhost:3306');
  mySQL.add('插入的一条记录');
}