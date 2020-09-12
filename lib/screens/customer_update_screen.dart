
import 'package:dart_flutter_example/widgets/form/update_cutomer_form.dart';
import 'package:flutter/material.dart';



class UpdateCustomerScreen extends StatelessWidget {

  static const routeName = '/customer/update';

  UpdateCustomerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            title: Text("Editar Cliente"),
        ),
        body: UpdateCustomerForm(),
    );
  }

}
