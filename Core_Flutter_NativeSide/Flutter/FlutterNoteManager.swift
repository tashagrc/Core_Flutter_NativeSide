//
//  FlutterNoteManager.swift
//  Core_Flutter_NativeSide
//
//  Created by Natasha Radika on 08/07/25.
//

// manages engine, channel
import Flutter
import UIKit

final class FlutterNoteManager {
    // singleton
    static let shared = FlutterNoteManager()
    
    private(set) var flutterEngine: FlutterEngine
    private(set) var flutterViewController: FlutterViewController?
    weak var delegate: NoteReceiverDelegate?
    
    private init() {
        flutterEngine = FlutterEngine(name: Constants.flutterEngineName)
        flutterEngine.run()
        flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        setupMethodChannel()
    }
    
    private func setupMethodChannel() {
        let channel = FlutterMethodChannel(name: Constants.channelName, binaryMessenger: flutterEngine.binaryMessenger)
        
        // act on flutter who call method on ios
        channel.setMethodCallHandler { [weak self] call, result in
            guard let self else { return }
            if call.method == Constants.methodName {
                if let args = call.arguments as? [String: Any], let note = args[Constants.methodArgument] as? String {
                    DispatchQueue.main.async {
                        self.delegate?.didReceiveNote(note)
                    }
                    result(Constants.methodResult)
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
    }
}
