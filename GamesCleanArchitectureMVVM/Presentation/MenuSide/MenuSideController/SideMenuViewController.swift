//
//  SideMenuViewController.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 11/01/23.
//

import Foundation
import UIKit


//clase que se encargara de cargar cargar la vista del menu, items etc
class SideMenuViewController: UIViewController {
    
    
    let sideMenuItems: [SideMenuItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    init(sideMenuItems: [SideMenuItem]) {
        self.sideMenuItems = sideMenuItems
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configureView() {
        
    }
    

}
