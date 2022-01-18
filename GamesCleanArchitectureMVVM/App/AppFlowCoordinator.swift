//
//  AppFlowCoordinator.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 15/01/22.
//

import UIKit



class AppFlowCoordinator{
    var navigationController: UINavigationController?
    var appDIContainer: AppDIContainer?
    
    
    init(navigationController : UINavigationController){
        self.navigationController = navigationController
    }
    
    
    func start(){
        let view = GamesListViewController.create()
        navigationController?.pushViewController(view, animated: false)
    }
    
}
