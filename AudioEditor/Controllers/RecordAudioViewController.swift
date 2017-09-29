//
//  RecordAudioViewController.swift
//  AudioEditor
//
//  Created by Lorence Lim on 26/09/2017.
//  Copyright © 2017 Ingenuity. All rights reserved.
//

import AVFoundation
import UIKit

class RecordAudioViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordLabel: UILabel!
    
    var audioRecorder: AVAudioRecorder!
    enum RecordingState { case startRecording, stopRecording }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.isEnabled = false
    }

    func configureUI(_ recordState: RecordingState) {
        switch(recordState) {
        case .startRecording:
            recordLabel.text = "Recording in Progress"
            stopButton.isEnabled = true
            recordButton.isEnabled = false
        case .stopRecording:
            recordLabel.text = "Tap to Record"
            recordButton.isEnabled = true
            stopButton.isEnabled = false
        }
    }
    
    // MARK: - Actions
    
    @IBAction func startRecording(_ sender: Any) {
        configureUI(.startRecording)
        
        let format = DateFormatter()
        format.dateFormat="yyyyMMddHHmmss"
        let recordingName = "recording-\(format.string(from: Date())).wav"
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        configureUI(.stopRecording)
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    @IBAction func showRecordings(_ sender: Any) {
        performSegue(withIdentifier: "ListAudioSegue", sender: self)
    }
    
    // MARK: - Audio Recorder Delegate
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "PlayRecordedAudioSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlayRecordedAudioSegue" {
            let playAudioVC = segue.destination as! PlayAudioViewController
            playAudioVC.recordedAudioURL = audioRecorder.url
        }
    }
}

