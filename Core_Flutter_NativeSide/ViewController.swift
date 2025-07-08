//
//  ViewController.swift
//  Core_Flutter_NativeSide
//
//  Created by Natasha Radika on 05/07/25.
//

import UIKit
import Flutter

class ViewController: UIViewController, NoteReceiverDelegate {

    private var stackView = UIStackView()
    private var notePreview = UILabel()
    private var addNoteButton = UIButton()
    private let noteStore: NoteUserDefaultsProtocol
    
    init(noteStore: NoteUserDefaults = NoteUserDefaults()) {
        self.noteStore = noteStore
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        title = "Note App"
        setupUI()
    }
    
    private func setupUI() {
        configureStackView()
        configureNotePreviewLabel()
        configureEditNoteButton()
        setStackViewConstraints()
    }

    func configureStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        view.addSubview(stackView)
    }
    
    func configureNotePreviewLabel() {
        notePreview.text = noteStore.loadNote()
        notePreview.numberOfLines = 0
        notePreview.adjustsFontSizeToFitWidth = true
        notePreview.textAlignment = .center
        stackView.addArrangedSubview(notePreview)
    }
    
    func configureEditNoteButton() {
        addNoteButton = UIButton(type: .system)
        addNoteButton.setTitle("Edit note", for: .normal)
        addNoteButton.backgroundColor = .systemBlue
        addNoteButton.setTitleColor(.white, for: .normal)
        addNoteButton.layer.cornerRadius = 8
        addNoteButton.addTarget(self, action: #selector(didTapEditNoteButton), for: .touchUpInside)
        stackView.addArrangedSubview(addNoteButton)
    }
    
    @objc func didTapEditNoteButton() {
        guard let flutterVC = FlutterNoteManager.shared.flutterViewController else { return }
        present(flutterVC, animated: true, completion: nil)
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        stackView.spacing = 16
    }
    
    func didReceiveNote(_ note: String) {
        DispatchQueue.main.async {
            self.updateNotePreview(with: note)
        }
    }
    
    private func updateNotePreview(with note: String) {
        notePreview.text = note
        noteStore.save(note: note)
    }
}

