//
//  ViewModel.swift
//  OutlineViewDemo
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2019 Appcoda. All rights reserved.
//

import Foundation

class ViewModel {
    
    // MARK: - Properties
    
    var model = Model()
    
    
    // MARK: - Init
    
    init() {
        
    }
    
    
    // MARK: - Custom Methods
    
    /**
     Create a new collection with the given title. If the `collection`
     parameter values has been provided, then add it as an item to that
     collection. Otherwise append it to the collections array of the `model`
     property as a top level collection.
    */
    func createCollection(withTitle title: String, inCollection collection: Collection?) {
        if let collection = collection {
            collection.items.append(Collection(withTitle: title, id: model.getCollectionID()))
        } else {
            model.collections.append(Collection(withTitle: title, id: model.getCollectionID()))
        }
    }
    
    
    /**
     Create a new color and add it as an item to the given collection.
    */
    func addColor(to collection: Collection) -> Color {
        let newColor = Color(withID: model.getColorID())
        collection.items.append(newColor)
        return newColor
    }
    
    
    /**
     It removes the given item from the collection if it has been
     specified, or it removes a collection from the top level
     collections in the model object.
    */
    func remove<T>(item: T, from collection: Collection?) {
        // If the collection parameter value is not nil then remove
        // the given item from the specified collection.
        if let collection = collection {
            collection.remove(item: item)
        } else {
            // If the collection parameter value is nil and the
            // given item is a collection, then delete it from the
            // collections array of the model property.
            if T.self == Collection.self {
                model.collections.removeAll { $0 == item as! Collection }
            }
        }
        
    }

}
