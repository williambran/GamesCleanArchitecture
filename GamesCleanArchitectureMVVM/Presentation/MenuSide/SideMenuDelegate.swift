//
//  SideMenuDElegate.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 11/01/23.
//

import Foundation


protocol SideMenuDelegate: AnyObject {
    func menuButtonTapped()
    func itemSelected(item: ContentViewControllerPresentation)
}
