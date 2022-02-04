//
//  ViewController.swift
//  MobileChallenge
//
//  Created by Musoni nshuti Nicolas on 02/02/2022.
//

import UIKit

class ViewController: UIViewController {

    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.1568627451, blue: 0.2078431373, alpha: 1)
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
        button.addTarget(self, action: #selector(addTodo), for: .touchUpInside)
        return button
    }()
    let filterBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "text.alignright"), for: .normal)
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
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 5
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
        table.register(TodoItemCellTableViewCell.self, forCellReuseIdentifier: "TodolistCell")
        table.isUserInteractionEnabled = true
        return table
    }()
    var todos = [TodoList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
        fetchTodo()
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
        fetchTodo()
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
        mainView.addSubview(todoTableView)
        view.addSubview(addTodoBtn)
        loader.center = view.center
        loader.startAnimating()
        headerView.layoutConstraints(top: view.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, size: .init(width: 0, height: 250))
        topLogo.layoutConstraints(top: view.safeAreaLayoutGuide.topAnchor, leading: headerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 20, bottom: 0, right: 0), size: .init(width: 40, height: 40))
        filterBtn.layoutConstraints(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: headerView.trailingAnchor, padding: .init(top: 6, left: 0, bottom: 0, right: -20), size: .init(width: 40, height: 40))
        searchBtn.layoutConstraints(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: filterBtn.leadingAnchor, padding: .init(top: 6, left: 0, bottom: 0, right: -15), size: .init(width: 40, height: 40))
        addTodoBtn.layoutConstraints(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: -20, right: -35), size: .init(width: 60, height: 60))
        mainView.layoutConstraints(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 60, left: 20, bottom: 0, right: -20))
        welcomeLbl.layoutConstraints(top: mainView.topAnchor, leading: mainView.leadingAnchor, bottom: nil, trailing: mainView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        noValueView.layoutConstraints(top: welcomeLbl.bottomAnchor, leading: mainView.leadingAnchor, bottom: mainView.bottomAnchor, trailing: mainView.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        withValuesView.layoutConstraints(top: welcomeLbl.bottomAnchor, leading: mainView.leadingAnchor, bottom: nil, trailing: mainView.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 60))
        todoTableView.layoutConstraints(top: withValuesView.bottomAnchor, leading: mainView.leadingAnchor, bottom: mainView.bottomAnchor, trailing: mainView.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 0))
    }
    @objc private func addTodo(){
        let createTodo = CreateTodoVC()
        let backBarBtn = UIBarButtonItem()
        backBarBtn.title = ""
        backBarBtn.image = UIImage(systemName: "arrow-backward")
        navigationItem.backBarButtonItem = backBarBtn
        navigationController?.pushViewController(createTodo, animated: true)
    }
    private func fetchTodo(){
        StorageManager.shared.fetchAll { [weak self] todoItems in
            DispatchQueue.main.async {
                if todoItems.count == 0 {
                    self?.fail()
                    return
                }
                self?.success()
                self?.todos = todoItems
                self?.todoTableView.reloadData()
                self?.withValuesView.totalTaskLbl.text = "\(todoItems.count)"
                let doneTasks = todoItems.filter{$0.status == "completed"}
                self?.withValuesView.activeTaskLbl.text = "\(todoItems.count - doneTasks.count)"
                self?.withValuesView.doneTaskLbl.text = "\(doneTasks.count)"
                print("items: \(todoItems.count) todo: \(String(describing: self?.todos.count))")
            }
        } onFail: { [weak self] error in
            print(error)
            self?.fail()
        }
    }
    private func success(){
        todoTableView.reloadData()
        noValueView.isHidden = true
        withValuesView.isHidden = false
        todoTableView.isHidden = false
        loader.isHidden = true
    }
    private func fail(){
        loader.isHidden = true
        noValueView.isHidden = false
        todoTableView.isHidden = true
        withValuesView.isHidden = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodolistCell", for: indexPath) as! TodoItemCellTableViewCell
        cell.titleLbl.text = "\(indexPath.row + 1) \(todos[indexPath.row].title ?? "")"
        cell.statusLbl.text = todos[indexPath.row].priority
        cell.createdAtLbl.text = "Created \(dateString(date: todos[indexPath.row].created_at ?? Date()))"
        cell.updatedAtLbl.text = "Modified \(dateString(date: todos[indexPath.row].updated_at ?? Date()))"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let singleTodo = TodoDetailsVC()
        let backBarBtn = UIBarButtonItem()
        backBarBtn.title = ""
        backBarBtn.image = UIImage(systemName: "arrow-backward")
        navigationItem.backBarButtonItem = backBarBtn
        singleTodo.updateContent(with: todos[indexPath.row])
        navigationController?.pushViewController(singleTodo, animated: true)
    }
    private func dateString(date: Date)-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM y"
        return dateFormatter.string(from: date)
    }
}

