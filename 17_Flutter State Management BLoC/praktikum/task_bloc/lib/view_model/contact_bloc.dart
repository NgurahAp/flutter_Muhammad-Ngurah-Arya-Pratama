import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_form/models/contact_model.dart';
import 'package:task_form/view_model/contact_event.dart';
import 'package:task_form/view_model/contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(const ContactState([])) {
    on<AddContact>((event, emit) {
      final updatedContacts = List<Contact>.from(state.contacts)..add(event.contact);
      emit(ContactState(updatedContacts));
    });

    on<RemoveContact>((event, emit) {
      final updatedContacts = List<Contact>.from(state.contacts)
        ..remove(event.contact);
      emit(ContactState(updatedContacts));
    });

    on<EditContaact>((event, emit) {
      final updatedContacts = List<Contact>.from(state.contacts);
      final index =
          updatedContacts.indexWhere((contact) => contact == event.oldContact);
      if (index != -1) {
        updatedContacts[index] = event.updatedContact;
        emit(ContactState(updatedContacts));
      }
    });
  }
}
