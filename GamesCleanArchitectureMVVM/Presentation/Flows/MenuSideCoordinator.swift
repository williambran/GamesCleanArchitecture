//
//  MenuSideCoordinator.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 10/01/23.
//

import Foundation
import UIKit




@available(iOS 13.0, *)
class MenuSideCoordinator: Coordinator {

    
    //impementacion de metodos del coordinator
    var childCoordinators: [AppChildCoordinator : Coordinator]?
    
    var navigationController: UINavigationController?
    
    
    
    
    // TODO: Inicialization class
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        //iniciar flujo
        let Home = HomeViewController()
        let settings = SettingsViewController()
        let sideMenuItems: [SideMenuItem] = [
            SideMenuItem(name: "Home", icon: UIImage(systemName: "house.fill"), viewController: .embed(Home)),
            SideMenuItem(name: "Configuracion", icon: UIImage(systemName: "gear"), viewController: .embed(settings))
        ]
        
        let sideMenuViewController = SideMenuViewController(sideMenuItems: sideMenuItems)
        let container = ContainerViewController(sideMenuViewController: sideMenuViewController, rootViewController: Home)
        
        navigationController?.topViewController?.removeFromParent()
        navigationController?.pushViewController(container, animated: true)
        
    }
    
}
