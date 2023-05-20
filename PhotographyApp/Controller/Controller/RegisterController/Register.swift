//
//  Register.swift
//  PhotographyApp
//
//  Created by Alparslan Cafer on 20.05.2023.
//

import Foundation

struct RegisterAccount: Codable {
    var emailAdress : String?
    var password    : String?
}


public enum AnimationType {
    case systemActivityIndicator
    case horizontalCirclesPulse
    case lineScaling
    case singleCirclePulse
    case multipleCirclePulse
    case singleCircleScaleRipple
    case multipleCircleScaleRipple
    case circleSpinFade
    case lineSpinFade
    case circleRotateChase
    case circleStrokeSpin
}

public enum AnimatedIcon {
    case succeed
    case failed
    case added
}

public enum AlertIcon {
    case heart
    case doc
    case bookmark
    case moon
    case star
    case exclamation
    case flag
    case message
    case question
    case bolt
    case shuffle
    case eject
    case card
    case rotate
    case like
    case dislike
    case privacy
    case cart
    case search
}
