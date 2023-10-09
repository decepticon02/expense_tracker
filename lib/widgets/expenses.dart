import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
class Expenses extends StatefulWidget{
    const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }

}
class _ExpensesState extends State<Expenses>{

  final List<Expense> _registeredExpenses =[
    //probne promenljive kasnije se uklone
    Expense(title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
     category: Category.work,
    ),

    Expense(title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay(){
    showModalBottomSheet(
        context: context,
        builder: (ctx)=> const NewExpense(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar je ona traka na vrhu ekrana
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay,
              icon:  const Icon(Icons.add),
          )
        ],
      ),
      body:Column(
        children:[
          const Text('The Chart'),
          // expanded sluzi da bi flater shvatio kako da obradi listu u listi
          Expanded(child:ExpensesList(
            expenses: _registeredExpenses,
          )
          )
        ],
      ),
    );
  }
}