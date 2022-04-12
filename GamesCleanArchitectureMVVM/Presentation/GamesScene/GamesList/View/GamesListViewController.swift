//
//  ListGamesViewController.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 15/01/22.
//

import UIKit

class GamesListViewController: UIViewController,Storyboarded {
    
    @IBOutlet private var searchBarContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        print("Inicio bien")
        // Do any additional setup after loading the view.
    }
    
    var viewModel: GamesListViewModelProtocol!
    
    static func create(viewModel: GamesListViewModelProtocol) -> GamesListViewController  {
        let view = GamesListViewController.instantiateVC()
        view.viewModel = viewModel
        return view
        
    }

    
    deinit{
        print("Se librero memoria2")
        //action.evento()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
