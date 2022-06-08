//
//  ViewController.swift
//  ExRollingText
//
//  Created by KIM HOSE on 2022/06/08.
//

import UIKit

class ViewController: UIViewController {
  
  private let label: UILabel = {
    let label = UILabel()
    label.text = "Start"
    label.font = .systemFont(ofSize: 20, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var button: UIButton = {
    let button = UIButton()
    button.setTitle("클릭", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.addTarget(self, action: #selector(makeCATransitionLabel), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(label)
    view.addSubview(button)
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: view.centerYAnchor),

      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
    ])
  }
  @objc func makeCATransitionLabel() {
    label.rolling(toChange: "바뀜")
  }
}


public extension UILabel {
  func rolling(toChange: String) {

    self.text = toChange
    let transition = CATransition()
    transition.duration = 1
    transition.timingFunction = .init(name: .easeInEaseOut)
    transition.type = .push
    transition.subtype = .fromTop
    self.layer.add(transition, forKey: CATransitionType.push.rawValue)
  }
}
