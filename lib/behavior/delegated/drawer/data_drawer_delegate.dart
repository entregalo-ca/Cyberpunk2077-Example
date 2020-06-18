import 'package:flutter/material.dart';
import 'package:prueba_flutter/behavior/delegated/drawer_delegate.dart';
import 'package:prueba_flutter/behavior/observer/observer.dart';
import 'package:prueba_flutter/behavior/observer/observer_action.dart';
import 'package:prueba_flutter/behavior/observer/observer_event.dart';
import 'package:prueba_flutter/behavior/observer/observer_singlenton.dart';

class DataDrawerDelegated implements DrawerDelegate {

  Observer _observer;

  DataDrawerDelegated() {
    _observer = SinglentonObserver.get();
  }

  @override
  void navigateToHome(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  @override
  void navigateToCustomer(BuildContext context) {
    _observer.notify(new ObserverAction(ObserverEvent.EVENT_TAB_CUSTOMER, 0));
    Navigator.of(context).pop();
  }

  @override
  void navigateToInvoiced(BuildContext context) {
    _observer.notify(new ObserverAction(ObserverEvent.EVENT_TAB_INVOICE, 1));
    Navigator.of(context).pop();
  }

  @override
  void navigateToSettings(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  void navigateToAbout(BuildContext context) {
    Navigator.of(context).pop();
  }
}
