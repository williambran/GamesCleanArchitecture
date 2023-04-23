//
//  ContainerViewController.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 11/01/23.
//

import Foundation
import UIKit


//contenedor donde estara contenido toda la vista que se agrege a el
class ContainerViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    convenience init(sideMenuViewController: SideMenuViewController, rootViewController: UIViewController ){
        self.init()
    }
    

}
