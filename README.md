# Goal
Understand Flutter and native iOS communication.

# Description
This iOS project is the home page that will be integrated with the Flutter module. This project contains a text label to show note preview and a button that can be clicked to show Flutter page. The note is saved locally using UserDefaults for simplicity.

# Things learned
- Setup CocoaPods in iOS project.
- Using FlutterEngine, FlutterViewController, FlutterMethodChannel, FlutterLifeCycle to communicate with Flutter module.

# Project structure
- AppDelegate.swift
- SceneDelegate.swift
- ViewController.swift: configure the UI.
- /Flutter
  - FlutterNoteManager.swift: singleton bridge between native iOS and Flutter that handles communication using MethodChannel.
- /Notes
  - Note.swift: the note model.
  - NoteReceiverDelegate.swift: a delegate protocol that will be called when user click a button to send a note to native. 
  - NoteUserDefaults.swift: handle save and load functionality to UserDefaults.
- /Util
  - Constants.swift

# Screenshot
<img src="https://github.com/user-attachments/assets/767d829f-9084-49f2-8dc7-778f4b5496d0" alt="Simulator Screenshot - iPhone 16 Pro" width="300" />

