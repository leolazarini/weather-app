//
//  ViewController.swift
//  weather-app
//
//  Created by Leonardo Filipe Lazarini on 13/11/22.
//

import UIKit

protocol WeatherViewControllerProtocol{
    func presentAlert(message: String)
}

class WeatherViewController: UIViewController, WeatherViewControllerProtocol {
    
    private var presenter: WeatherPresenterProtocol
    
    init(presenter: WeatherPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.getWeather(city: "Joinville")
    }
    
    private func getWeather(city: String){
        createSpinnerView()
        self.presenter.getWeather(city: city)
    }

}



