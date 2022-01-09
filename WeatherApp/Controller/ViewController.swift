//
//  ViewController.swift
//  WeatherApp
//
//  Created by Евгений Ганусенко on 1/8/22.
//

import UIKit

class ViewController: UIViewController {

    var backgroundImageView: UIImageView = {
        var imageBackground = UIImageView()
        imageBackground.clipsToBounds = true
        imageBackground.image = .init(named: "Background")
        imageBackground.translatesAutoresizingMaskIntoConstraints = false
        return imageBackground
    }()

    var weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.image = .init(systemName: "cloud.rain.fill")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var cityLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.numberOfLines = 1
        return lable
    }()

    var temperatureLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        lable.textColor = .white
        lable.text = "25C"
        lable.font = .systemFont(ofSize: 60)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()

    var feelsTemperatureLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        lable.text = "Fill's like 23C"
        lable.textColor = .white
        lable.font = .systemFont(ofSize: 15)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()

    var searchButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "magnifyingglass.circle")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.clipsToBounds = true
        return button
    }()

    // MARK: - SetupHierarchy

    func setupHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(weatherIconImageView)
        view.addSubview(cityLable)
        view.addSubview(temperatureLable)
        view.addSubview(feelsTemperatureLable)
        view.addSubview(searchButton)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupHierarchy()
        setupLayout()
    }

}

// MARK: - SetupLayout

extension ViewController {
    func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor),

            weatherIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            weatherIconImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 200),
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 200),

            temperatureLable.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 160),
            temperatureLable.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -100),
            temperatureLable.heightAnchor.constraint(equalTo: view.heightAnchor),
            temperatureLable.widthAnchor.constraint(equalTo: view.widthAnchor),

            feelsTemperatureLable.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 180),
            feelsTemperatureLable.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -60),
            feelsTemperatureLable.heightAnchor.constraint(equalTo: view.heightAnchor),
            feelsTemperatureLable.widthAnchor.constraint(equalTo: view.widthAnchor),

            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 150),
            searchButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 350),
            searchButton.heightAnchor.constraint(equalToConstant: 100),
            searchButton.widthAnchor.constraint(equalToConstant: 100)

        ])
    }

}
