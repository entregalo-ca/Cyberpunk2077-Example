import 'package:flutter/material.dart';
import 'package:prueba_flutter/legacy/domain/customer.dart';
import 'package:prueba_flutter/legacy/http/customer_http.dart';
import 'package:prueba_flutter/views/customer/strategy/create/reload_customer_create.dart';

class CreateCustomerForm extends StatefulWidget {

  CreateCustomerForm({Key key,}) : super(key: key);

  @override
  CreateCustomerFormState createState() => CreateCustomerFormState();

}

class CreateCustomerFormState extends State<CreateCustomerForm> {

  GlobalKey<FormState> _formKey;
  Customer _customer;
  String _strategyFlag;
  CustomerHttp _repository;

  Future<Null> _showDialog(BuildContext context) async {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("Se ha guardado el Cliente.")));
    return Future.delayed(new Duration(seconds: 1), () => null);
  }

  @override
  void initState() {
    super.initState();
    _formKey = new GlobalKey<FormState>();
    _customer = new Customer();
    _customer.setStatus(1);
    _strategyFlag = "";
    _repository = new CustomerHttp();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

     final String arg = ModalRoute.of(context).settings.arguments;
     if (arg != null) {
       _strategyFlag = arg;
     }

    return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
              builder: (context) {
                return Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(icon: Icon(Icons.grid_on), labelText: "Codigo", hintText: "eg. 01010102"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Por favor ingrese el codigo correctamente.";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _customer.setCode(val);
                        },
                      ),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(icon: Icon(Icons.person), labelText: "Nombre", hintText: "eg. Beco C.A"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Por favor ingrese el nombre correctamente.";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _customer.setName(val.toUpperCase());
                        },
                      ),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(icon: Icon(Icons.directions), labelText: "Direccion", hintText: "eg. Valencia, AV Bolivar, Casa #9091"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Por favor ingrese la direccion correctamente.";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _customer.setAdress(val);
                        },
                      ),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(icon: Icon(Icons.mail), labelText: "Correo", hintText: "eg. ejemplo@mail.com"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Por favor ingrese el correo correctamente.";
                          }
                          return null;
                        },
                        onSaved: (val) {
                           _customer.setMail(val);
                        },
                      ),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(icon: const Icon(Icons.phone), labelText: "Telefono", hintText: "eg. +584263214569"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Por favor ingrese el telefono correctamente.";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _customer.setPhone(val);
                        },
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                        child: RaisedButton(
                            child: Text("Crear"),
                            onPressed: () {
                              final form = _formKey.currentState;
                              if (form.validate()) {

                                 ///Salvar la entidad.
                                 form.save();

                                 /// Guardar entidad en el Back End
                                 _repository.add(_customer);

                                 ///Mostrar el dialogo de confirmacion.
                                 _showDialog(context).then((val) {
                                   final ReloadCustomerCreate _satrategy = new ReloadCustomerCreate(context);

                                   switch (_strategyFlag) {

                                     case ReloadCustomerCreate.HOME_STRATEGY:
                                       _satrategy.setReloadCustomerFromHome();
                                       break;

                                     case ReloadCustomerCreate.DATA_STRATEGY:
                                       _satrategy.setReloadCustomerFromData();
                                       break;
                                   }

                                   _satrategy.reloadCustomer();

                                 });
                              }
                            }
                         ),
                      ),
                    ],
                  ),
                );
              }
            ),
          ),

    );
  }

}