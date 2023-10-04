import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // ListView se koristi kada imamo listu
    // koja je dugacka
    //builder obezbedjuje da se ne napravi sve u
    // listi odmah nego kad je potrebno

    return ListView.builder(
      //idemCount objsnjava koliko clanova liste ce da se obradi
      itemCount: expenses.length,
      itemBuilder:  (ctx, index) => ExpenseItem(expenses[index]),

    );
  }

}