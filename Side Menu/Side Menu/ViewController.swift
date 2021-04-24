//
//  ViewController.swift
//  Side menu
//
//  Created by Pavel Akulenak on 24.04.21.
//

import UIKit

class ViewController: UIViewController {
    private var isSideMenuShown = false
    private var sideMenuView = UIView()
    private var tapRecognizer = UITapGestureRecognizer()

    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var sideMenuRedButton: UIButton!
    @IBOutlet weak var sideMenuBlueButton: UIButton!
    @IBOutlet weak var sideMenuGrayButton: UIButton!
    @IBOutlet weak var sideMenuWhiteButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = Bundle.main.loadNibNamed("SideMenuView", owner: self, options: nil)?.first as? UIView {
            sideMenuView = view
        }
        sideMenuView.frame = CGRect(x: -sideMenuView.frame.width, y: 0, width: sideMenuView.frame.width, height: view.frame.height)
        view.addSubview(sideMenuView)
        sideMenuRedButton.layer.cornerRadius = 25
        sideMenuBlueButton.layer.cornerRadius = 25
        sideMenuGrayButton.layer.cornerRadius = 25
        sideMenuWhiteButton.layer.cornerRadius = 25
        tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onMenuButton))
    }

    @IBAction private func onMenuButton(_ sender: Any) {
        if !isSideMenuShown {
            UIView.animate(withDuration: 0.5) {
                let x = self.menuButton.frame.minX + self.sideMenuView.frame.width
                self.menuButton.frame = CGRect(x: x, y: self.menuButton.frame.minY, width: self.menuButton.frame.width, height: self.menuButton.frame.height)
                self.sideMenuView.frame = CGRect(x: 0, y: 0, width: self.sideMenuView.frame.width, height: self.view.frame.height)
                self.contentView.alpha = 0.5
            } completion: { _ in
                self.isSideMenuShown = true
                self.contentView.addGestureRecognizer(self.tapRecognizer)
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                let x = self.menuButton.frame.minX - self.sideMenuView.frame.width
                self.menuButton.frame = CGRect(x: x, y: self.menuButton.frame.minY, width: self.menuButton.frame.width, height: self.menuButton.frame.height)
                self.sideMenuView.frame = CGRect(x: -self.sideMenuView.frame.width, y: 0, width: self.sideMenuView.frame.width, height: self.view.frame.height)
                self.contentView.alpha = 1
            } completion: { _ in
                self.isSideMenuShown = false
                self.contentView.removeGestureRecognizer(self.tapRecognizer)
            }
        }
    }

    @IBAction private func onSideMenuRedButton(_ sender: Any) {
        contentView.backgroundColor = .red
    }

    @IBAction private func onSideMenuBlueButton(_ sender: Any) {
        contentView.backgroundColor = .blue
    }

    @IBAction private func onSideMenuGrayButton(_ sender: Any) {
        contentView.backgroundColor = .gray
    }

    @IBAction private func onSideMenuWhiteButton(_ sender: Any) {
        contentView.backgroundColor = .white
    }
}
