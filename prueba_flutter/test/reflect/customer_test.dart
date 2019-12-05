
import 'dart:convert';
import 'dart:core';
import 'dart:core' as prefix0;

import 'package:flutter_test/flutter_test.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:prueba_flutter/domain/customer.dart';
import 'package:prueba_flutter/serialize/customer_json_serializer.dart';

void main() {

    test('Customer Encode', () {
        var co = new Customer(1, 'fff', 'brayan', 'valencia', 'brayanmartinez827@gmail.com',
            '+58426649380', 'Y', DateTime.now().toString(), DateTime.now().toString());

        final repo = new JsonRepo(serializers: [new CustomerJsonSerializer()]);
        print(repo.encode(co));

        print(jsonEncode(co));

        final DateTime parsedDate = DateTime.parse(co.createdAt);
        print(parsedDate);

        print("Ejecutando pruebas...");
    });

    test("Customer Decode", () {

        var co = '{"id":1,"code":"fff","name":"brayan","adress":"valencia","mail":"brayanmartinez827@gmail.com",'
            '"phone":"+58426649380","status":"Y","createdAt":"2019-12-04 13:30:38.400808","updatedAt":"2019-12-04 13:30:38.406860"}';
        
        final repo = new JsonRepo(serializers: [new CustomerJsonSerializer()]);
        print(repo.decode(co));

        print(jsonDecode(co));

        print("Ejecutando pruebas...");
    });

}
