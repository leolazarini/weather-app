//
//  AppCoordinator.swift
//  weather-app
//
//  Created by Leonardo Filipe Lazarini on 28/12/22.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    let window: UIWindow?
    var currentViewController: UIViewController?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let service = WeatherService()
        let weatherPresenter = WeatherPresenter(coordinator: self, service: service)
        let weatherViewController = WeatherViewController(presenter: weatherPresenter)
        weatherPresenter.viewController = weatherViewController
        
        window?.rootViewController = weatherViewController
        window?.makeKeyAndVisible()
        
        currentViewController = weatherViewController
    }
}

extension AppCoordinator: WeatherCoordinatorProtocol {
    func navigateToResult(weatherModel: WeatherModel) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let resultViewController = ResultViewController(weatherModel: weatherModel)
        let resultViewController = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController
        resultViewController?.weatherModel = weatherModel
        currentViewController?.present(resultViewController!, animated: true, completion: { [weak self] in
            self?.currentViewController = resultViewController
        })
    }
}
