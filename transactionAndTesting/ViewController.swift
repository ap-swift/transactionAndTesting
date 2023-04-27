//
//  ViewController.swift
//  CheckTransactions
//
//  Created by Artem Parfenov on 22.04.2023.
//

import UIKit

class FirstViewController: UIViewController {

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("I'm button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(openSecondViewController), for: .touchUpInside)
        return button
    }()

    private lazy var viewLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 4, y: 30, width: 100, height: 40))
        label.text = "Hello World!"
        label.textColor = .black
        return label
    }()

    private lazy var tapBarLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 22, y: 30, width: 100, height: 40))
        label.text = "TabBar"
        label.textColor = .black
        return label
    }()

    private lazy var picture = UIImageView(image: UIImage(named: "muchas-frambuesas"))

    private var smallView = UIView()
    private var secondSmallView = UIView()
    private var changeIconColorView = UIView()
    private var animation = UIView()
    private var presentView = UIView()
//    private var presentViewOneWay = UIView() // one-way
    private var dialogWindow = UIView()

    var isSelected: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "First(Root) Controller"
        view.backgroundColor = UIColor.white

        openViewByTap()
        openViewByLongTap()
        changeColorByTap()
        animationByTap()
        tapViewForPresentView()
        tapViewForPresentshowDialogWindow()
        tapPicture()
        addSubviews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    func addSubviews() {
        view.addSubview(smallView)
        view.addSubview(button)
        view.addSubview(secondSmallView)
        view.addSubview(changeIconColorView)
        view.addSubview(animation)
        view.addSubview(presentView)
        view.addSubview(dialogWindow)
        view.addSubview(picture)
    }

    @objc func openSecondViewController() {
        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .brown
        secondViewController.title = "pushViewController"
        navigationController?.pushViewController(secondViewController, animated: true)
    }

    @objc func openThirdViewController() {
        let thirdViewController = UIViewController()
        thirdViewController.view.backgroundColor = .cyan
        thirdViewController.title = "viewTapped"
        navigationController?.pushViewController(thirdViewController, animated: true)
    }

    @objc func openTabBarController() {
        let barController = UITabBarController(nibName: nil, bundle: nil)
        barController.setViewControllers([GreenBarViewController(), YellowBarViewController()], animated: true)
        barController.tabBar.barTintColor = .black
        navigationController?.pushViewController(barController, animated: false)
    }


    @objc func changeColorOfIcon() {
        isSelected.toggle()
        changeIconColorView.backgroundColor = isSelected ? .blue : .gray
    }


    @objc func animationAction() {
        UIView.animate(withDuration: 0.5) {
            self.animation.frame = .init(x: 260, y: 220, width: 100, height: 100)
        }
    }

    @objc func showPresentView() {
        present(GreenBarViewController(), animated: true)
    }

    @objc func showDialogWindow() {
        let alertController = UIAlertController(title: "AlertController", message: "Take decision", preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "Yes", style: .default)
        let secondAction = UIAlertAction(title: "No", style: .cancel)
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        present(alertController, animated: true)
    }

    @objc func showOneWayController() {
        let vc = UIViewController()
        vc.view.layer.backgroundColor = UIColor.blue.cgColor
        let navigationControllerForImage = UINavigationController(rootViewController: vc)
        present(navigationControllerForImage, animated: true)
    }


    func openViewByTap() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(openThirdViewController))
        smallView.addGestureRecognizer(recognizer)
    }

    func openViewByLongTap() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(openTabBarController))
        secondSmallView.addGestureRecognizer(recognizer)
    }

    func changeColorByTap() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(changeColorOfIcon))
        changeIconColorView.addGestureRecognizer(recognizer)
    }

    func animationByTap() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(animationAction))
        animation.addGestureRecognizer(recognizer)
    }

    func tapViewForPresentView() {
        presentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPresentView)))
    }

    func tapViewForPresentshowDialogWindow() {
        dialogWindow.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showDialogWindow)))
    }

    func tapPicture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(showOneWayController))
        picture.addGestureRecognizer(gesture)
        picture.isUserInteractionEnabled = true // must use it for pictures
    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        button.frame = CGRect(
            x: 20,
            y: 100,
            width: 100,
            height: 100)
        button.layer.cornerRadius = 50

        smallView.frame = CGRect(
            x: button.frame.maxX + 20,
            y: 100,
            width: 100,
            height: 100)
        smallView.backgroundColor = .cyan
        smallView.addSubview(viewLabel)
        smallView.layer.cornerRadius = 50

        secondSmallView.frame = CGRect(
            x: smallView.frame.maxX + 20,
            y: 100,
            width: 100,
            height: 100)
        secondSmallView.backgroundColor = .brown
        secondSmallView.addSubview(tapBarLabel)
        secondSmallView.layer.cornerRadius = 50

        changeIconColorView.frame = CGRect(
            x: 20,
            y: button.frame.maxY + 20,
            width: 100,
            height: 100)
        changeIconColorView.layer.cornerRadius = 50
        changeIconColorView.backgroundColor = .magenta

        animation.frame = CGRect(
            x: button.frame.maxX + 20,
            y: button.frame.maxY + 20,
            width: 100,
            height: 100)
        animation.backgroundColor = .red
        animation.layer.cornerRadius = 50

        presentView.frame = CGRect(
            x: 20,
            y: changeIconColorView.frame.maxY + 20,
            width: 100,
            height: 100)
        presentView.layer.backgroundColor = UIColor.systemTeal.cgColor
        presentView.layer.cornerRadius = 50

        print(changeIconColorView.frame.maxY)

        dialogWindow.frame = CGRect(
            x: changeIconColorView.frame.maxX + 20,
            y: 460,
            width: 100,
            height: 100)
        dialogWindow.layer.backgroundColor = UIColor.systemFill.cgColor
        dialogWindow.layer.cornerRadius = 50
        dialogWindow.layer.borderWidth = 2
        dialogWindow.layer.borderColor = UIColor.red.cgColor
        dialogWindow.accessibilityIdentifier = "dialogWindow" // for XCUItest

        picture.frame = CGRect(
            x: smallView.frame.maxX + 20,
            y: 580,
            width: 100,
            height: 100)
        picture.contentMode = .scaleAspectFit
        picture.clipsToBounds = true // for clipping bounds of object
        picture.layer.cornerRadius = 50
        picture.layer.borderWidth = 2
        picture.layer.borderColor = UIColor.black.cgColor
    }

}
