//
//  ListAudioTableViewController+FileManager.swift
//  AudioEditor
//
//  Created by Lorence Lim on 28/09/2017.
//  Copyright © 2017 Ingenuity. All rights reserved.
//

import UIKit

extension ListAudioTableViewController: FileManagerDelegate {
    
    func fileManager(_ fileManager: FileManager, shouldMoveItemAt srcURL: URL, to dstURL: URL) -> Bool {
        return true
    }
}
