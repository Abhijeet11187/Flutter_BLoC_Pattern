# Flutter_BLoC_Pattern Review

Block Pattern in flutter


1. Do your imports 
		dart:async
		import the file where this all is going to be applied

2. List of employes
		
		class EmployeBLOC{
			    List<Employe> _empList=[
                              Employe(id1,name1,salary1),
			      Employe(id2,name2,salary2),
		  	      Employe(id3,name3,salary3),
                              ]
			}


3. Stream Controller

		final _employeListStreamController=StreamController<List<Employe>>();

		final _employeSalaryIncrementController=StreamController<Employe>(); 

         	final _employeSalaryDecrementController=StreamController<Employe>();


4. Stream Sink Getter

		How General Getter looks like :

				datatype get  varname => inputVariable
				int      get  id      => this.id
                
		Getter in BLoC:

		       Stream<List<Employe>> get employeListStream => _employeListStreamController.stream;  //Stream for getting data
                       StreamSink<List<Employe>> get employeListSink => _employeListStreamController.sink;   //Sink is for outputting (adding)the data

		       StreamSink<Employe> get employeSalaryIncreament=> _employeSalaryIncrementController.sink;   //Sink is for outputting (adding) the data
			
		       StreamSink<Employe> get employeSalaryDecreament=> _employeSalaryDecrementController.sink;   //Sink is for outputting (adding) the data


5. Contructor for add data and listen to changes 

			EmployeBLOC(){
				
				_employeListStreamController.add(_empList);  //Adding the Data in constructor	

				employeSalaryIncreament.stream.listen(_increamentSalary);   // _increamentSalary is a function capable for changing data
				employeSalaryDecreament.stream.listen(_decreamentSalary);   // _decreamentSalary is a function capable for changing data			
	
			}


6. Core functions

                    _increamentSalary(Employe employe){
				
					double salary = employe.salary;
					double increamentSalary = salary * 20/100;

					// update the salary	
					
					_empList[employe.id -1].salary = salary + increamentSalary ;

					// Add to the sink 

					employeListSink.add(_empList); //if we dont add this the listen thing is not going to listen changed data
									

		     }


        	    _decreamentSalary(Employe employe){
				
					double salary = employe.salary;
					double decreamentSalary = salary * 20/100;

					// update the salary	
					
					_empList[employe.id -1].salary = salary - decreamentSalary ;

					// Add to the sink 

					employeListSink.add(_empList); //if we dont add this the listen thing is not going to listen changed data
			

		     }

7. Dispose



			void Dispose(){
					
				 _employeListStreamController.close();
 			         _employeSalaryIncrementController.close(); 
 				 _employeSalaryDecrementController.close();	
			
			}
