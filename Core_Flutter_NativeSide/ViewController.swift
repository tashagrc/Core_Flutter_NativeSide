//
//  ViewController.swift
//  Core_Flutter_NativeSide
//
//  Created by Natasha Radika on 05/07/25.
//

import UIKit
import Flutter

class ViewController: UIViewController, NoteReceiverDelegate {

    var stackView = UIStackView()
    var notePreview = UILabel()
    var addNoteButton = UIButton()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Note App"
        self.view.backgroundColor = .systemBackground
        configureStackView()
        addNotePreviewLabelToStackView()
        addButtonToStackView()
        setStackViewConstraints()
    }

    func configureStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0
        view.addSubview(stackView)
    }
    
    func addNotePreviewLabelToStackView() {
        loadNotePreviewFromUserDefaults()
        notePreview.numberOfLines = 0
        notePreview.adjustsFontSizeToFitWidth = true
        notePreview.textAlignment = .center
        stackView.addArrangedSubview(notePreview)
    }
    
    func addButtonToStackView() {
        addNoteButton = UIButton(type: .system)
        addNoteButton.setTitle("Edit note", for: .normal)
        addNoteButton.backgroundColor = .systemBlue
        addNoteButton.setTitleColor(.white, for: .normal)
        addNoteButton.layer.cornerRadius = 8
        addNoteButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        stackView.addArrangedSubview(addNoteButton)
    }
    
    @objc func buttonTapped() {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        present(flutterViewController, animated: true, completion: nil)
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        stackView.spacing = 16
    }
    
    // will delete later
    func setDummyNoteIfFirstLaunch() {
        let hasLaunchedBefore = defaults.bool(forKey: "hasLaunchedBefore")
        if !hasLaunchedBefore {
            let dummyNote = Note(content: "What's on your mind?")
            defaults.set(dummyNote, forKey: "userNote")
            defaults.set(true, forKey: "hasLaunchedBefore")
        }
    }
    
    func loadNotePreviewFromUserDefaults() {
        let note = defaults.string(forKey: "userNote") ?? "What's on your mind?"
        notePreview.text = note
    }
    
    func didReceiveNote(_ note: String) {
        DispatchQueue.main.async {
            self.notePreview.text = note
            self.defaults.set(note, forKey: "userNote")
            self.defaults.set(true, forKey: "hasLaunchedBefore")
        }
    }
}

