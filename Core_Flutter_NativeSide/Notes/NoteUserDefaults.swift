//
//  NoteUserDefaults.swift
//  Core_Flutter_NativeSide
//
//  Created by Natasha Radika on 08/07/25.
//

import Foundation

protocol NoteUserDefaultsProtocol {
    func loadNote() -> String
    func save(note: String)
}

final class NoteUserDefaults: NoteUserDefaultsProtocol {
    private let defaults = UserDefaults.standard
    
    func loadNote() -> String {
        return defaults.string(forKey: Constants.noteKey) ?? Constants.defaultNote
    }
    
    func save(note: String) {
        defaults.set(note, forKey: Constants.noteKey)
    }
}
