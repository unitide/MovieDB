//
//  LoginViewController.swift
//  MovieDB
//
//  Created by Mingyong Zhu on 5/23/22.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: UI Properties
    lazy private var userNameLabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.text = "Username"
        userNameLabel.font =  UIFont.systemFont(ofSize: 16)
        userNameLabel.tintColor = .red
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return userNameLabel
    }()

    lazy private var passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.systemFont(ofSize: 16)
        passwordLabel.tintColor = .red
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLabel
    }()

    lazy private var userNameInput: UITextField = {
        let userNameInput = UITextField()
        userNameInput.backgroundColor = .white
        userNameInput.font = UIFont.systemFont(ofSize: 16)
        userNameInput.textAlignment = .center
        userNameInput.layer.borderWidth = 3
        userNameInput.layer.borderColor = UIColor.black.cgColor
        userNameInput.layer.cornerRadius = 5
        userNameInput.translatesAutoresizingMaskIntoConstraints = false
        return userNameInput
    }()

    lazy private var passwordInput: UITextField = {
        let  passwordInput = UITextField()
        passwordInput.backgroundColor = .white
        passwordInput.font = UIFont.systemFont(ofSize: 16)
        passwordInput.textAlignment = .center
        passwordInput.isSecureTextEntry = true
        passwordInput.layer.borderWidth = 3
        passwordInput.layer.borderColor = UIColor.black.cgColor
        passwordInput.layer.cornerRadius = 5
        passwordInput.translatesAutoresizingMaskIntoConstraints = false
        return passwordInput
    }()

    lazy private var signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.backgroundColor = .blue
        signInButton.titleLabel?.tintColor = .white
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.layer.borderColor = UIColor.black.cgColor
        signInButton.layer.borderWidth = 5
        signInButton.layer.cornerRadius = 5
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(userSignIn), for: .touchUpInside)
        return signInButton
    }()

    lazy private var signUpButton: UIButton = {
        let signUpButton = UIButton()
        signUpButton.backgroundColor = .blue
        signUpButton.titleLabel?.tintColor = .white
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.layer.borderColor = UIColor.black.cgColor
        signUpButton.layer.borderWidth = 5
        signUpButton.layer.cornerRadius = 5
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.addTarget(self, action: #selector(userSignUp), for: .touchUpInside)
        return signUpButton
    }()

    lazy private var cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.backgroundColor = .blue
        cancelButton.titleLabel?.tintColor = .white
        cancelButton.setTitle("Exit", for: .normal)
        cancelButton.layer.borderColor = UIColor.black.cgColor
        cancelButton.layer.borderWidth = 5
        cancelButton.layer.cornerRadius = 5
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action: #selector(exitApp), for: .touchUpInside)
        return cancelButton
    }()
    // MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan
        setupUI()
    }

    // MARK: Private methods
    /**
     Setup UI for login screen
     - Parameters: None
     - Returns: None
     */
    private func setupUI() {
        let userNameStack = UIStackView()
        userNameStack.addArrangedSubview(userNameLabel)
        userNameStack.setCustomSpacing(20, after: userNameStack)
        userNameStack.addArrangedSubview(userNameInput)
        userNameStack.axis = .horizontal
        userNameStack.distribution = .fillEqually

        let passwordStack = UIStackView()
        passwordStack.addArrangedSubview(passwordLabel)
        passwordStack.setCustomSpacing(20, after: passwordStack)
        passwordStack.addArrangedSubview(passwordInput)
        passwordStack.axis = .horizontal
        passwordStack.distribution = .fillEqually

        let optionButtonStack = UIStackView()
        optionButtonStack.addArrangedSubview(signInButton)
        optionButtonStack.setCustomSpacing(10, after: signInButton)
        optionButtonStack.addArrangedSubview(signUpButton)
        optionButtonStack.setCustomSpacing(10, after: signUpButton)
        optionButtonStack.addArrangedSubview(cancelButton)
        optionButtonStack.axis = .horizontal
        optionButtonStack.distribution = .fillEqually

        let loginUIStack = UIStackView()
        loginUIStack.addArrangedSubview(userNameStack)
        loginUIStack.setCustomSpacing(20, after: userNameStack)
        loginUIStack.addArrangedSubview(passwordStack)
        loginUIStack.setCustomSpacing(20, after: passwordStack)
        loginUIStack.addArrangedSubview(optionButtonStack)
        loginUIStack.axis = .vertical
        loginUIStack.distribution = .fillEqually

        loginUIStack.frame = view.bounds
        loginUIStack.frame.size.height = view.bounds.size.height / 5.0
        loginUIStack.frame.size.width = view.bounds.size.width * 2.0/3.0
        loginUIStack.center = view.center
        view.addSubview(loginUIStack)
    }
    // MARK: - Objc methods
    @objc private func userSignIn() {
        let username = userNameInput.text ?? ""
        let password = passwordInput.text ?? ""
        if isValidUser(user: username, password: password) {
            // TODO: - launch main screen
            self.navigationController?.pushViewController(MainMovieViewController(), animated: true)
        } else {
            let alertMessage = UIAlertController(title: "Error", message: "Your identity can't be verified by the system, please check your username and password !!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .cancel)
            alertMessage.addAction(OKAction)
            self.present(alertMessage, animated: true)
        }
    }
    @objc private func userSignUp() {
        let username = userNameInput.text ?? ""
        let password = passwordInput.text ?? ""
        if saveUser(user: username, password: password) {
            let alertMessage = UIAlertController(title: "Success", message: "You have successfully sign up with the username \(username) !!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .cancel)
            alertMessage.addAction(OKAction)
            self.present(alertMessage, animated: true)
        } else {
            let alertMessage = UIAlertController(title: "Failure", message: "You have failed to sign up with the username \(username) !!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .cancel)
            alertMessage.addAction(OKAction)
            self.present(alertMessage, animated: true)
        }
    }
    /**
     Exit the App
     */
    @objc private func exitApp() {
        exit(0)
    }
    private func saveUser(user: String, password: String) -> Bool {
        guard !user.isEmpty, !password.isEmpty else {
            return false
        }
        let defaults = UserDefaults.standard
        var userList = defaults.object(forKey: "userList") as? [String:String] ?? [String:String]()
        userList[user] = password
        defaults.set(userList, forKey: "userList")
        return true
    }
    private func isValidUser(user: String, password: String) -> Bool {
        guard !user.isEmpty, !password.isEmpty else {
            return false
        }
        let defaults = UserDefaults.standard
        let userList = defaults.object(forKey: "userList") as? [String:String] ?? [String:String]()
        let storedPassword = userList[user] ?? ""
        return password == storedPassword ? true: false
    }
}
