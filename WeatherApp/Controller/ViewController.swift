//
//  ViewController.swift
//  WeatherApp
//
//  Created by Евгений Ганусенко on 1/8/22.
//

import UIKit

class ViewController: UIViewController {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

   private lazy var backgroundImageView: UIImageView = {
        let imageBackground = UIImageView()
        imageBackground.clipsToBounds = true
        imageBackground.image = .init(named: "Background")
        imageBackground.translatesAutoresizingMaskIntoConstraints = false
        return imageBackground
    }()

    private lazy var weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "cloud.rain.fill")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var cityLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.numberOfLines = 1
        return lable
    }()

    private lazy var temperatureLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        lable.textColor = .white
        lable.text = "25C"
        lable.font = .systemFont(ofSize: 60)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()

    private lazy var feelsTemperatureLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        lable.text = "Fill's like 23C"
        lable.textColor = .white
        lable.font = .systemFont(ofSize: 15)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()

    private lazy var searchButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "magnifyingglass.circle")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()



    // MARK: - SetupHierarchy

    func setupHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(stackView)
        stackView.addSubview(weatherIconImageView)
        stackView.addSubview(cityLable)
        stackView.addSubview(temperatureLable)
        stackView.addSubview(feelsTemperatureLable)
        stackView.addSubview(searchButton)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    @objc
    func tapButton() {
        self.presentSearchAlertController(withTitle: "Enter city name", massege: nil, style: .alert)
    }

}


// MARK: - SetupLayout

extension ViewController {

    func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0),
            backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0),

            stackView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -8),

            weatherIconImageView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 100),
            weatherIconImageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 150),


            temperatureLable.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 150),
            temperatureLable.heightAnchor.constraint(equalTo: stackView.heightAnchor, constant: -200),
            temperatureLable.widthAnchor.constraint(equalTo: stackView.widthAnchor),

            feelsTemperatureLable.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 150),
            feelsTemperatureLable.heightAnchor.constraint(equalTo: stackView.heightAnchor, constant: -120),
            feelsTemperatureLable.widthAnchor.constraint(equalTo: stackView.widthAnchor),

            searchButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor, constant: 100),
            searchButton.centerYAnchor.constraint(equalTo: stackView.centerYAnchor, constant: 250)


        ])
    }
}

extension ViewController {

    func presentSearchAlertController(withTitle title: String?, massege: String?, style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: massege, preferredStyle: style)
        alert.addTextField { textFild in
            let cities = ["Moscow", "New York", "Kiev", "Viena", "Stambul", "Moscow"]
            textFild.placeholder = cities.randomElement()
            let search = UIAlertAction(title: "Search", style: .default) { action in
                let textField = alert.textFields?.first
                guard let cityName = textField?.text else { return }
                if cityName != "" {
                    print("search info for the \(cityName)")
                }
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(search)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
    }

}
