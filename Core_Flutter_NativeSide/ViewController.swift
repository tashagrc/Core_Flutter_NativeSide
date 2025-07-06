//
//  ViewController.swift
//  Core_Flutter_NativeSide
//
//  Created by Natasha Radika on 05/07/25.
//

import UIKit

class ViewController: UIViewController {

    var stackView = UIStackView()
    var notePreview = UILabel()
    var addNoteButton = UIButton()
    
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
        notePreview.text = "What is on your mind?"
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
        print("button was tapped")
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        stackView.spacing = 16
    }
}

