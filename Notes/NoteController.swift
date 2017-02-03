//
//  NoteController.swift
//  Notes
//
//  Created by Jeremiah Hawks on 2/3/17.
//  Copyright © 2017 Jeremiah Hawks. All rights reserved.
//

import Foundation
class NoteController {
    
    // MARK: - Properties
    var noteEntriesArray = [Note]()
    static let sharedController = NoteController()
    private let noteEntriesArrayKey = "NoteEntriesArrayKey"
    
    // MARK: - Initializer
    init() {
        loadFromPersistantStore()
        print("Hold on to your butts...")
    }
    
    // MARK: - Create
    func addNote(withEntry noteEntry: String) {
        let noteEntry = Note(noteEntry: noteEntry)
        noteEntriesArray.append(noteEntry)
        saveToPersistantStore()
    }
    
    // MARK: - Load from persistant store
    func loadFromPersistantStore() {
        if let noteEntriesDictionaryArray = UserDefaults.standard.value(forKey: noteEntriesArrayKey) as? [[String: String]] {
            var noteEntriesArray: [Note] = []
            for noteDictionary in noteEntriesDictionaryArray {
                if let noteEntry = Note(dictionary: noteDictionary) {
                    noteEntriesArray.append(noteEntry)
                }
            }
            self.noteEntriesArray = noteEntriesArray
        }
    }
    
    // MARK: - Edit
    func editNote(atIndex index: IndexPath, withNote note: Note) {
        noteEntriesArray.remove(at: index.row)
        noteEntriesArray.insert(note, at: index.row)
    }
    
    // MARK: - Save to persistant store
    func saveToPersistantStore() {
        var noteEntriesDictionaryArray: [[String: String]] = []
        for note in noteEntriesArray {
            let noteEntryDictionary = note.dictionaryRepresentation
            noteEntriesDictionaryArray.append(noteEntryDictionary)
        }
        UserDefaults.standard.set(noteEntriesDictionaryArray, forKey: noteEntriesArrayKey)
    }
    
    // MARK: - Delete
    func remove(noteEntry: Note) {
        if let indexOfNote = noteEntriesArray.index(of: noteEntry) {
            noteEntriesArray.remove(at: indexOfNote)
        }
        saveToPersistantStore()
    }
    
    
}
