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
    
    
      static func create() -> GamesListViewController  {
        let view = GamesListViewController.instantiateVC()
        
        return view
        
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
