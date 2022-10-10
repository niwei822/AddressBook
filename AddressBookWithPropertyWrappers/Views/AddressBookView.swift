//
//  ContentView.swift
//  AddressBookWithPropertyWrappers
//
//  Created by Ben Stone on 3/3/21.
//

import SwiftUI

struct AddressBookView: View {
    // TODO: STATEOBJECT - Add property wrapper to viewModel so that it observes changes
    //@StateObject is used to store new instances of reference type data conforms Observableobject protocol
    //owns the data
    //make sure viewModel instance not get destroyed when view updates
    @StateObject private var viewModel = AddressBookViewModel()
    
    // TODO: STATE - Add property wrapper to displayFavoriteCount property so it can be reassigned
    //@State == Mutating allow us to modify values inside struct(view)
    //for simple property that never get used outside view(marked as private)
    @State private var displayFavoriteCount = true
    
    var body: some View {
        VStack {
            Text("Address Book")    
                .font(.title)
                .padding()                               
            Spacer()
            ContactsView() //TODO: ENVIRONMENTOBJECT - Pass the viewModel to the ContactsView
                .environmentObject(viewModel)
            Spacer()
            if displayFavoriteCount {
                HStack {
                    Text("You have \(viewModel.favoritedContactCount) favorite" + (viewModel.favoritedContactCount != 1 ? "s" : ""))
                        .padding()
                    Spacer()
                }
            }
            // TODO: STATE - Add toggle for displayFavoriteCount
            //Prefixing a State property with a $ will return a Binding associated with that property
            Toggle("Display number of favorites", isOn: $displayFavoriteCount)
        }
        .background(Color(red: 254/255, green: 240/255, blue: 229/255).ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AddressBookView()
    }
}
