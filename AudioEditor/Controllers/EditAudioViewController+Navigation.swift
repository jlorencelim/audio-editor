//
//  EditAudioViewController+Navigation.swift
//  AudioEditor
//
//  Created by Lorence Lim on 28/09/2017.
//  Copyright © 2017 Ingenuity. All rights reserved.
//

import UIKit

extension EditAudioViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        (viewController as? PlayAudioViewController)?.rate = rateSlider.value
        (viewController as? PlayAudioViewController)?.pitch = pitchSlider.value
        (viewController as? PlayAudioViewController)?.echo = echoSwitch.isOn
        (viewController as? PlayAudioViewController)?.reverb = reverbSwitch.isOn
    }
}
