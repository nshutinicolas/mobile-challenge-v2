//
//  TodoDetailsVC.swift
//  MobileChallenge
//
//  Created by Musoni nshuti Nicolas on 03/02/2022.
//

import UIKit

class TodoDetailsVC: UIViewController {
    
    let todoImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
//        image.image = UIImage(named: "IB_logo")
        return image
    }()
    let topStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalCentering
        return stack
    }()
    let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 8
        return stack
    }()
    let statusLbl: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.font = .systemFont(ofSize: 15)
        label.backgroundColor = .black
        label.textColor = .white
        label.text = "Medium"
        return label
    }()
    let editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "applepencil"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(editTodoItem), for: .touchUpInside)
        return button
    }()
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "multiply"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(deleteTodoItem), for: .touchUpInside)
        return button
    }()
    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("DONE", for: .normal)
        button.layer.borderWidth = 1
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(completeTask), for: .touchUpInside)
        return button
    }()
    let completedButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(deleteTodoItem), for: .touchUpInside)
        button.setTitleColor(.green, for: .normal)
//        button.tintColor = .green
        return button
    }()

    let titleLbl: UILabel = {
        let label = UILabel()
        label.text = "This is a placeholder for hthi task"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    let descriptionTitleLbl: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    let descriptionLbl: UILabel = {
        let label = UILabel()
        label.text = "this is he fdkjnvsl dfjkvjw kf vsf sfdv skdfn ds"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    let createdAtLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.text = "Created 3 Jan 2020"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    let updatedAtLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.text = "Updated 3Jan 2021"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    let writeDateStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 4
        return stack
    }()

    var todo: TodoList?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.addSubview(todoImageView)
        view.addSubview(topStack)
        view.addSubview(titleLbl)
        view.addSubview(descriptionTitleLbl)
        view.addSubview(descriptionLbl)
        view.addSubview(writeDateStack)
        topStack.addArrangedSubview(statusLbl)
        topStack.addArrangedSubview(buttonStack)
        buttonStack.addArrangedSubview(editButton)
        buttonStack.addArrangedSubview(deleteButton)
        buttonStack.addArrangedSubview(doneButton)
        doneButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        writeDateStack.addArrangedSubview(createdAtLbl)
        writeDateStack.addArrangedSubview(updatedAtLbl)

        todoImageView.layoutConstraints(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, size: .init(width: 0, height: 250))
        topStack.layoutConstraints(top: todoImageView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: -20))
        
        editButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        titleLbl.layoutConstraints(top: topStack.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: -20))
        descriptionTitleLbl.layoutConstraints(top: titleLbl.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 40, left: 20, bottom: 0, right: -20))
        descriptionLbl.layoutConstraints(top: descriptionTitleLbl.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 15, left: 20, bottom: 0, right: -20))
        writeDateStack.layoutConstraints(top: descriptionLbl.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 15, left: 15, bottom: 0, right: -10))
    }
    
    public func updateContent(with todoItem: TodoList){
        DispatchQueue.main.async { [weak self] in
            self?.todo = todoItem
            self?.titleLbl.text = todoItem.title
            self?.descriptionLbl.text = todoItem.todo_description
            self?.createdAtLbl.text = "Created \(self?.dateString(date: todoItem.created_at ?? Date()) ?? "")"
            self?.updatedAtLbl.text = "Updated \(self?.dateString(date: todoItem.updated_at ?? Date()) ?? "")"
            self?.todoImageView.image = UIImage(data: todoItem.photo!)
            if todoItem.status == "completed"{
                self?.doneButton.setTitle("", for: .normal)
                self?.doneButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
            }
        }
    }
    
    @objc private func completeTask(){
        if let todo = todo {
            if todo.status == "completed" {
                return
            }
            StorageManager.shared.completeTaskUpdate(of: todo) { [weak self] success in
                if success {
                    DispatchQueue.main.async {
                        self?.todo?.status = "completed"
                        return
                    }
                }
                print("Something not fine")
                return
            }
        }
    }
    @objc private func deleteTodoItem(){
        if let todo = todo {
            StorageManager.shared.deleteTodoItem(item: todo) { [weak self] success in
                if success {
                    self?.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    @objc private func editTodoItem(){
        print("To edit later")
    }
    private func dateString(date: Date)-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM y"
        return dateFormatter.string(from: date)
    }
}
