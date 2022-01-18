//
//  Storyboarded.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 15/01/22.
//

import UIKit



protocol Storyboarded {
    associatedtype T
   
    static var defaultFileName: String { get }
    static func instantiateVC(_ bundle: Bundle?) -> T
}



extension Storyboarded where Self: UIViewController{
    
    //name of vc
    static var defaultFileName: String {
        NSStringFromClass(self).components(separatedBy: ".")[1]
    }
    
    
    static func instantiateVC(_ bundle: Bundle? = nil) -> Self {
        let fullName = defaultFileName
        let storyBoard =  UIStoryboard(name: fullName, bundle:  bundle)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: fullName) as? Self else {
            
            fatalError("Cannot instantiate initial view controller \(Self.self) from storyboard with name \(fullName)")
        }
        return vc
    }
    
    
}



