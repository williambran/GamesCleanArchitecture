//
//  ContentViewControllerPresentation.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 11/01/23.
//

import Foundation
import UIKit



enum ContentViewControllerPresentation {
    case embed(UIViewController)
    case push(UIViewController)
    case modal(UIViewController)
}
