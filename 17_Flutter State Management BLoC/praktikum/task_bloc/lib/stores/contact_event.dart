import 'package:equatable/equatable.dart';
import 'package:task_form/models/contact_model.dart';

abstract class ContactEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddContact extends ContactEvent {
  final Contact contact; 

  AddContact(this.contact);

  @override
  List<Object?> get props => [contact];
}

class RemoveContact extends ContactEvent {
  final Contact contact; 

  RemoveContact(this.contact);

  @override
  List<Object?> get props => [contact];
}

class EditContaact extends ContactEvent {
  final Contact oldContact;
  final Contact updatedContact;

  EditContaact(this.oldContact, this.updatedContact);

  @override
  List<Object?> get props => [oldContact, updatedContact];
}
