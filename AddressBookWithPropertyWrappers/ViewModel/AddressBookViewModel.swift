//
//  AddressBookViewModel.swift
//  AddressBookViewModel
//
//  Created by Ben Stone on 2/12/21.
//

import Foundation

class AddressBookViewModel: ObservableObject {
    // is used for any property that you want to notify views whenever its value has changed.
    //@Published attribute can only be used for properties inside classes and not structures.
    //@Published: NSNotificationCenter
    //tell swiftUI it should refresh any view using this property when it is changed
   @Published var addressBook = AddressBook() // TODO: PUBLISHED - Add a property wrapper so that changes will be published
    
    var contactCount: Int { addressBook.numberOfContacts }
    
    var favoritedContactCount: Int { addressBook.numberOfFavorites }
    
    func toggleFavorite(atIndex index: Int) {
        addressBook.toggleFavorite(atIndex: index)
    }
    
    func contact(atIndex index: Int) -> Contact {
        addressBook.contact(atIndex: index)
    }
}
