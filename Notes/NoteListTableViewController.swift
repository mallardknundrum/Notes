//
//  NoteListTableViewController.swift
//  Notes
//
//  Created by Jeremiah Hawks on 2/3/17.
//  Copyright © 2017 Jeremiah Hawks. All rights reserved.
//

import UIKit

class NoteListTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }


    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteController.sharedController.noteEntriesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteListCell", for: indexPath)
        let note = NoteController.sharedController.noteEntriesArray[indexPath.row]
        cell.textLabel?.text = note.noteEntry
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let noteEntry = NoteController.sharedController.noteEntriesArray[indexPath.row]
            NoteController.sharedController.remove(noteEntry: noteEntry)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNoteDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let note = NoteController.sharedController.noteEntriesArray[indexPath.row]
                if let noteDetailsViewController = segue.destination as? NoteDetailsViewController {
                    noteDetailsViewController.noteEntry = note
                    noteDetailsViewController.editMode = true
                    noteDetailsViewController.editIndex = indexPath
                }
            }
        }
    }
}
