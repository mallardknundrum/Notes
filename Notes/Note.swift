//
//  Note.swift
//  Notes
//
//  Created by Jeremiah Hawks on 2/3/17.
//  Copyright © 2017 Jeremiah Hawks. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    // MARK: - Properties
    let noteEntry: String
    let noteEntryKey = "noteEntryKey"
    var dictionaryRepresentation: [String: String] {
        let dictionary = [noteEntryKey: noteEntry]
        return dictionary
    }
    
    // MARK: - Initializers
    init(noteEntry: String) {
        self.noteEntry = noteEntry
    }
    init?(dictionary: [String: String]) {
        if let noteEntry = dictionary[noteEntryKey] {
            self.noteEntry = noteEntry
        } else {
            return nil
        }
    }
}
func ==(lhs: Note, rhs: Note) -> Bool {
    return rhs.noteEntry == lhs.noteEntry
}
