
class Customer {
  String name;
  int age;

  Customer(this.name, this.age);

  @override
  String toString() {
    return '{ ${this.name}, ${this.age} }';
  }
}

main() {
  final CountryCodeToName =
  [{
    "US": "01",
    "GBP": "17",
    "EUR": "33"
  }];


  print(CountryCodeToName[0]);
  // print(customers.length);


  List jimy=[{"name":"John","age":"45","address":"123 Main St"},{"name":"yojit","age":"10","address":"123 Main St"},{"name":"John suthar","age":"4fdsf5","address":"123 Main St"}];

  print(jimy[0]["name"]);
  var ok=jimy[0]["name"];
  print(ok);
  var a;
  var b;

  for (int i=0;i<10;i++) {
    if (jimy[i]["name"]=="yojit"){
      a=jimy[i]["name"];
      b=jimy[i]["age"];
      break;
    }
  }

  print(a);
  print(b);

  // print(sList.firstWhere((i) => i[0] == "yojit")); // three


}