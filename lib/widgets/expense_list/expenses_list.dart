import 'package:flutter/material.dart';
import 'package:penny_wiser/models/expense.dart';
import 'package:penny_wiser/widgets/expense_list/expense_item.dart';
import 'package:penny_wiser/widgets/expense_list/expenses_list.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(ExpenseItem(expenses[index])),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
