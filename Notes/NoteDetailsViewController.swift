//
//  NoteDetailsViewController.swift
//  Notes
//
//  Created by Jeremiah Hawks on 2/3/17.
//  Copyright © 2017 Jeremiah Hawks. All rights reserved.
//

import UIKit

class NoteDetailsViewController: UIViewController {
    
    // MARK: - Properties
    var noteEntry: Note?
    var editMode: Bool = false
    var editIndex: IndexPath = [0]
    @IBOutlet weak var noteEntryTextField: UITextView!
    @IBAction func saveButtonTapped(_ sender: Any) {
        if editMode == true {
            if let noteEntry = noteEntryTextField.text  {
                let noteEntryNoteType = Note(noteEntry: noteEntry)
                NoteController.sharedController.editNote(atIndex: editIndex, withNote: noteEntryNoteType)
                _ = self.navigationController?.popViewController(animated: true)
                self.editMode = false
            }
        } else {
            if let noteEntry = noteEntryTextField.text  {
                NoteController.sharedController.addNote(withEntry: noteEntry)
                _ = self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateViews() {
        if let noteEntry = noteEntry {
            noteEntryTextField.text = noteEntry.noteEntry
        } else {
            return
        }
    }
}
