import 'package:equatable/equatable.dart';
import 'package:task_form/models/contact_model.dart';

class ContactState extends Equatable {
  final List<Contact> contacts; 

  const ContactState(this.contacts);

  @override
  List<Object?> get props => [contacts];
}
