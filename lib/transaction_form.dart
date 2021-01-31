import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubimit;

  const TransactionForm({
    Key key,
    @required this.title,
    @required this.value,
    this.onSubimit,
  }) : super(key: key);

  final TextEditingController title;
  final TextEditingController value;

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
    _submitForm(){
      widget.onSubimit(widget.title.text, double.tryParse(widget.value.text) ?? 0.0);
    }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(labelText: 'Título'),
              controller: widget.title,
            ),
            TextField(
              onSubmitted: (_) => _submitForm(),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: true),
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
              controller: widget.value,
            ),
            FlatButton(

              minWidth: double.infinity,
              color: Theme.of(context).accentColor,
              textColor: Colors.yellowAccent,
              child: Text('Nova transação'),
              onPressed: _submitForm,
            )
          ],
        ),
      ),
    );
  }
}
