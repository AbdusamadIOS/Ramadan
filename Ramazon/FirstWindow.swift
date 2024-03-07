//
//  FirstWindow.swift
//  Ramazon
//
//  Created by Abdusamad Mamasoliyev on 06/03/24.
//

import UIKit

class FirstWindow: UIViewController {

    let firstWindow = UIImageView()
    let secondWindow = UIImageView()
    let ramadan = UIImageView()
    let openButton = UIButton()
    
    private lazy var endMenuAnchor = firstWindow.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    private lazy var startMenuAnchor = firstWindow.trailingAnchor.constraint(equalTo: view.leadingAnchor)
    
    private lazy var endMenuAnchor1 = secondWindow.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    private lazy var startMenuAnchor1 = secondWindow.leadingAnchor.constraint(equalTo: view.trailingAnchor)
    
    private var menuIsOpen = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
       
    }
    private func setup() {
        
        view.backgroundColor = .white
        firstWindow.image = UIImage(named: "left")
        firstWindow.contentMode = .scaleToFill
        secondWindow.image = UIImage(named: "right")
        secondWindow.contentMode = .scaleToFill
        
        firstWindow.translatesAutoresizingMaskIntoConstraints = false
        secondWindow.translatesAutoresizingMaskIntoConstraints = false
        
        openButton.layer.cornerRadius = 15
        openButton.clipsToBounds = true
        openButton.translatesAutoresizingMaskIntoConstraints = false
        openButton.setImage(UIImage.key, for: .normal)
        openButton.addTarget(self, action: #selector(openBtn), for: .touchUpInside)

        ramadan.image = UIImage.img
        ramadan.translatesAutoresizingMaskIntoConstraints = false
    }

    private func layout() {
        view.addSubview(ramadan)
        view.addSubview(firstWindow)
        view.addSubview(secondWindow)
        view.addSubview(openButton)
        
        startMenuAnchor.isActive = false
        endMenuAnchor1.isActive = true
        
        // firstWindow
        firstWindow.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        firstWindow.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        firstWindow.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        // seconWindow
        secondWindow.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        secondWindow.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        secondWindow.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        // open Button
        openButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 130).isActive = true
        openButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -130).isActive = true
        openButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        openButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        ramadan.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1).isActive = true
        ramadan.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 2).isActive = true
        ramadan.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    @objc func openBtn() {
    
        UIView.animate(withDuration: 8, delay: 0.1) { [weak self] in
            guard let self = self else { return }
            self.startMenuAnimation()
        }
        menuIsOpen.toggle()
    }
    func startMenuAnimation() {
        menuIsOpen ? remakeConstraintsToOpenMenu() : remakeConstraintsToCloseMenu()
        view.layoutSubviews()
    }
    func remakeConstraintsToOpenMenu() {
        startMenuAnchor.isActive = false
        endMenuAnchor.isActive = true
        startMenuAnchor1.isActive = false
        endMenuAnchor1.isActive = true
    }
    func remakeConstraintsToCloseMenu() {
        endMenuAnchor.isActive = false
        startMenuAnchor.isActive = true
        endMenuAnchor1.isActive = false
        startMenuAnchor1.isActive = true
    }
}

