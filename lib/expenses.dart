import 'package:expensetracker/ExpensesDataModel.dart';
import 'package:expensetracker/ExpensesList.dart';
import 'package:expensetracker/NewExpense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
/*
final List<ExpensesDataModel> _registeredExpenses = []; to store each expenses as object of ExpensesDataModel class
*/

  final List<ExpensesDataModel> _registeredExpenses = [];

  void _addExpenses(ExpensesDataModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpenses(ExpensesDataModel expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(
      () {
        _registeredExpenses.remove(expense);
      },
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('Deleted'),
        action: SnackBarAction(
            label: 'UNDO',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget? mainContent;
    if (_registeredExpenses.isNotEmpty) {
      mainContent = Expanded(
/*
if not empty, we must show list of expenses !
*/
        child: ExpensesList(
          expenses: _registeredExpenses,
          removeExpenses: _removeExpenses,
        ),
      );
    } else {
      mainContent = const Center(
        child: Text('You currently do not have anything saved !'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (ctx) => NewExpense(onAddExpense: _addExpenses),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          mainContent,
        ],
      ),
    );
  }
}
