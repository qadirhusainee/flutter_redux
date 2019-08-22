import 'package:flutter/material.dart';
import 'package:basic_flutter/utils/fieldValidators.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final formKey = GlobalKey<FormState>();
  var inputsMap = [
    {
      "index": 1,
      "value": null,
      "label": "Product Name",
      "focus": FocusNode(),
      "error": false,
      "errorText": null,
      "validator": emptyValidator,
      "keyboardType": TextInputType.text,
    },
    {
      "index": 2,
      "value": null,
      "label": "Description",
      "focus": FocusNode(),
      "error": false,
      "errorText": null,
      "validator": emptyValidator,
      "keyboardType": TextInputType.text,
    },
    {
      "index": 3,
      "value": null,
      "label": "Price",
      "focus": FocusNode(),
      "error": false,
      "errorText": null,
      "validator": numberValidator,
      "keyboardType": TextInputType.number,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      body: Center(
        child: Column(
          children: <Widget>[
            Form(
              key: formKey,
              child: buildFields(),
            ),
            RaisedButton(
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                onSubmit();
              },
              child: Text("Login"),
            ),
            Column(
                children: inputsMap
                    .map((field) => Text(field["value"] ?? "empty"))
                    .toList()),
          ],
        ),
      ),
    );
  }

  Widget buildFields() {
    return Column(
        children: inputsMap
            .map(
              (field) => TextFormField(
                    textInputAction: inputsMap.length == field["index"]
                        ? TextInputAction.go
                        : TextInputAction.next,
                    focusNode: field["focus"],
                    validator: field["validator"],
                    onFieldSubmitted: (term) {
                      // FocusScope.of(context).requestFocus(field["focus"]);
                    },
                    onSaved: (val) {
                      field["value"] = val;
                    },
                    keyboardType: field["keyboardType"],
                    decoration: InputDecoration(
                        labelText: field["label"],
                        hasFloatingPlaceholder: true,
                        errorText: null,
                        fillColor: Colors.yellowAccent),
                  ),
            )
            .toList());
  }

  onSubmit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      print("not valid");
    }
  }
}
