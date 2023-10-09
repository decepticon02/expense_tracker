
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }

}
class _NewExpenseState extends State<NewExpense>{
  /*// funkcija za cuvanje unetog teksta
  var _enteredTitle ='';

  void _saveTitleInput(String inputValue){
    _enteredTitle = inputValue;
  }*/

  // objekat optimizovan za unos teksta
 final _titleControler = TextEditingController();
 final _amountControler = TextEditingController();
  DateTime? _selectedDate;
 void _presentDatePicker () async {
   final now = DateTime.now();
   final firstDate = DateTime(now.year - 1, now.month,now.day);
    //async i await sluze za buduce vrednosti koje sa biraju
   final pickedDate = await showDatePicker( // objekat koji nam otvara kalendar
       context: context,
       initialDate: now,
       firstDate: firstDate,
       lastDate: now,
   );
   setState(() {
     _selectedDate = pickedDate;
   });
 }

  @override
  void dispose() {
    _titleControler.dispose();
    _amountControler.dispose();// otklanja memoriju bespotrebnog teksta
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {

    return  Padding(
        padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            //onChanged: _saveTitleInput,
            controller: _titleControler,
            maxLength: 50,
           // keyboardType: TextInputType.text,
            decoration: const InputDecoration(

              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  //onChanged: _saveTitleInput,
                  controller: _amountControler,
                  maxLength: 15,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox( width: 10,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ! sluzi da objasni flateru da _selectedDate nece biti null
                   Text(_selectedDate ==null ? 'No Date selected': formatter.format(_selectedDate!)),
                    IconButton(onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month)),
                  ],
                ),
              ),
            ],
          ),


          Row(
            children: [
              DropdownButton(
                  items: Category.values.map((category)=> DropdownMenuItem(
                    value: category,
                      child: Text(category.name.toString(),),
                  ),
                  ).toList(),
                  onChanged: (value){
                    print(value);
                  },
              ),

              ElevatedButton(
                  onPressed: (){
                    //print(_enteredTitle);
                    print(_titleControler.text);
                    print(_amountControler.text);
                  },
                  child: const Text("Save expense"),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);// klasa cija fja pop sklanja trenutni ekran

                },
                child: const Text("Cancel"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}