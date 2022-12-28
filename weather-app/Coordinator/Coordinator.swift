//
//  Coordinator.swift
//  weather-app
//
//  Created by Leonardo Filipe Lazarini on 28/12/22.
//

import UIKit

protocol Coordinator {
    var currentViewController: UIViewController? { get set }
    func start()
}
