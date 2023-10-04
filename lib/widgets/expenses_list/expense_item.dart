import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';


class ExpenseItem extends StatelessWidget{
    const ExpenseItem(this.expense, {super.key});

    final Expense expense;
  @override
  Widget build(BuildContext context) {
    //Card je widget koji nam da malo lepsi izgled i margine
    return Card(
      
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
          child: Column(
            children: [
              Text(expense.title),
              const SizedBox(height: 4),
              Row(
                children: [
                  //toStringFixed omogucava da se broj prebaci u string
                  // broj 2 znaci da ce broj biti na 2 decimale
                  // \- sluzi da bi se $ video kao tekst
                  Text('\$${expense.amount.toStringAsFixed(2)}'),
                  const Spacer(),
                  Row(
                    children: [
                       Icon(categoryIcons[expense.category]),
                      const SizedBox(width: 8,),
                      Text(expense.formattedDate),
                    ],
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }

}