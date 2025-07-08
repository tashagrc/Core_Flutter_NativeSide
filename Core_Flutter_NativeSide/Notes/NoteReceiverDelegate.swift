//
//  NoteReceiverDelegate.swift
//  Core_Flutter_NativeSide
//
//  Created by Natasha Radika on 08/07/25.
//

protocol NoteReceiverDelegate: AnyObject {
    func didReceiveNote(_ note: String)
}
