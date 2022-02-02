//
//  ViewController.swift
//  MobileChallenge
//
//  Created by Musoni nshuti Nicolas on 02/02/2022.
//

import UIKit

struct Todo {
    let id: String
    let title: String
    let descrition: String
    let priority: String
    let createDate: Date
    let UpdateDate: Date
}

class ViewController: UIViewController {

    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    let topLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "IW_logo")
        image.contentMode = .scaleAspectFill
        return image
    }()
    let addTodoBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 20, weight: .light))), for: .normal)
        button.contentMode = .scaleAspectFill
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 30
        return button
    }()
    let filterBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.tintColor = .white
        return button
    }()
    let searchBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = .white
        return button
    }()
    let loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.style = .large
        loader.color = .black
        return loader
    }()
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 4
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.4
        view.layer.masksToBounds = false
        return view
    }()
    let welcomeLbl: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        return label
    }()
    let noValueView = NoValueView()
    let withValuesView = WithValueView()
    let todoTableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "TodolistCell")
        table.isUserInteractionEnabled = true
        return table
    }()
    let todos = [Todo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.addSubview(headerView)
        headerView.addSubview(topLogo)
        headerView.addSubview(filterBtn)
        headerView.addSubview(searchBtn)
        view.addSubview(loader)
        view.addSubview(mainView)
        mainView.addSubview(welcomeLbl)
        mainView.addSubview(noValueView)
        noValueView.isHidden = true
        mainView.addSubview(withValuesView)
        view.addSubview(addTodoBtn)
        loader.center = view.center
        loader.startAnimating()
        headerView.layoutConstraints(top: view.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, size: .init(width: 0, height: 250))
        topLogo.layoutConstraints(top: view.safeAreaLayoutGuide.topAnchor, leading: headerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 20, bottom: 0, right: 0), size: .init(width: 40, height: 40))
        filterBtn.layoutConstraints(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: headerView.trailingAnchor, padding: .init(top: 6, left: 0, bottom: 0, right: -20), size: .init(width: 40, height: 40))
        searchBtn.layoutConstraints(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: filterBtn.leadingAnchor, padding: .init(top: 6, left: 0, bottom: 0, right: -25), size: .init(width: 40, height: 40))
        addTodoBtn.layoutConstraints(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: -20, right: -35), size: .init(width: 60, height: 60))
        mainView.layoutConstraints(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 60, left: 30, bottom: 0, right: -30))
        welcomeLbl.layoutConstraints(top: mainView.topAnchor, leading: mainView.leadingAnchor, bottom: nil, trailing: mainView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        noValueView.layoutConstraints(top: welcomeLbl.bottomAnchor, leading: mainView.leadingAnchor, bottom: mainView.bottomAnchor, trailing: mainView.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        withValuesView.layoutConstraints(top: welcomeLbl.bottomAnchor, leading: mainView.leadingAnchor, bottom: nil, trailing: mainView.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodolistCell", for: indexPath)
        cell.textLabel?.text = "\(todos[indexPath.row].title)"
        return cell
    }
    
    
}

