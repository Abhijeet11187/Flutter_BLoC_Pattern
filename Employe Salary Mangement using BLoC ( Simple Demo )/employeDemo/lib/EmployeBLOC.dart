import "dart:async";
import 'package:employeDemo/Employe.dart';

class EmployeBLOC {
  List<Employe> _empList = [
    Employe(1, "Abhi", 40000),
    Employe(2, "Jeet", 50000),
    Employe(3, "Abhijeet", 80000),
    Employe(4, "Deepak", 45000),
    Employe(5, "Sachin", 6000),
    Employe(6, "Sandeep", 55000),
    Employe(7, "Akash", 48000),
  ];

// Defining Controllers
  final _employeListStreamController = StreamController<List<Employe>>();
  final _employeSalaryIncrementController = StreamController<Employe>();
  final _employeSalaryDecrementController = StreamController<Employe>();

// Defining Getters

  Stream<List<Employe>> get employeListStream =>
      _employeListStreamController.stream;
  StreamSink<List<Employe>> get employeListSink =>
      _employeListStreamController.sink;

  StreamSink<Employe> get employeSalaryIncrement =>
      _employeSalaryIncrementController.sink;
  StreamSink<Employe> get employeSalaryDecrement =>
      _employeSalaryDecrementController.sink;

// Constructor

  EmployeBLOC() {
    _employeListStreamController.add(_empList);
    _employeSalaryIncrementController.stream.listen(_incrementSalary);
    _employeSalaryDecrementController.stream.listen(_decrementSalary);
  }

  // Core Functions

  _incrementSalary(Employe emp) {
       double salary=emp.salary;
       double incrementSalary = salary * 20/100;
       _empList[emp.id -1].salary = salary + incrementSalary ;
       // Adding to the sink
       employeListSink.add(_empList);
  }
  _decrementSalary(Employe emp) {
       double salary=emp.salary;
       double decrementSalary = salary * 20/100;
       _empList[emp.id -1].salary = salary - decrementSalary ;
       // Adding to the sink
       employeListSink.add(_empList);
  }

 // Dispose the Controllers

  void dispose(){
    _employeListStreamController.close();
    _employeSalaryIncrementController.close();
    _employeSalaryDecrementController.close();
  }
}
