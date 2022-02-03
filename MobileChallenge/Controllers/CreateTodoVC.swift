//
//  CreateTodoVC.swift
//  MobileChallenge
//
//  Created by Musoni nshuti Nicolas on 02/02/2022.
//

import UIKit
import DropDown
import CloudKit

class CreateTodoVC: UIViewController {
    let priorityDropdown = DropDown()
    let scrollView = UIScrollView()
    let wrappingView = UIView()
    let titleLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.text = "New task"
        label.textColor = .black
        return label
    }()
    let addImageLbl: UILabel = {
        let label = UILabel()
        label.text = "Add image"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    let tapImageView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9607843137, blue: 0.9647058824, alpha: 1)
        return view
    }()
    let selectedImageView = UIImageView()
    let picker = UIImagePickerController()
    let inputTitleLbl: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    let titleInputField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Task title (140 Characters)"
        textField.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9607843137, blue: 0.9647058824, alpha: 1)
        textField.layer.cornerRadius = 4
        return textField
    }()
    let inputDescriptionLbl: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    let descriptionInputField: UITextView = {
        let textView = UITextView()
        textView.text = "240 Characters"
        textView.textColor = .gray
        textView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9607843137, blue: 0.9647058824, alpha: 1)
        return textView
    }()
    let inputPriorityLbl: UILabel = {
        let label = UILabel()
        label.text = "Priority"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    let textPriorityView: UIView = {
        let view = UIView()
        return view
    }()
    let priorityTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Select priority"
        textField.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9607843137, blue: 0.9647058824, alpha: 1)
        textField.layer.cornerRadius = 4
        return textField
    }()
    let dropdownIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "")
        image.contentMode = .scaleAspectFit
        return image
    }()
    let addTodoBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("CREATE TASK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(onAddTodo), for: .touchUpInside)
        return button
    }()
    let testImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "IW_logo")
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        descriptionInputField.delegate = self
        let openImageSource = UITapGestureRecognizer(target: self, action: #selector(imageSourcePicker))
        tapImageView.addGestureRecognizer(openImageSource)
        let priorityTap = UITapGestureRecognizer(target: self, action: #selector(onOpenPriorityDropdown))
        textPriorityView.addGestureRecognizer(priorityTap)
        registerFirst()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.addSubview(scrollView)
        scrollView.addSubview(wrappingView)
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        [titleLbl,addImageLbl,tapImageView, inputTitleLbl, titleInputField, inputDescriptionLbl, descriptionInputField, inputPriorityLbl, textPriorityView].forEach { item in
            wrappingView.addSubview(item)
        }
        scrollView.layoutConstraints(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        wrappingView.layoutConstraints(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor)
        wrappingView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        textPriorityView.addSubview(priorityTextField)
        titleLbl.layoutConstraints(top: wrappingView.topAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 30, left: 20, bottom: 0, right: -20))
        addImageLbl.layoutConstraints(top: titleLbl.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 40, left: 20, bottom: 0, right: -15))
        tapImageView.layoutConstraints(top: addImageLbl.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 10, left: 15, bottom: 0, right: -15), size: .init(width: 0, height: 150))
        inputTitleLbl.layoutConstraints(top: tapImageView.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 30, left: 15, bottom: 0, right: -15))
        titleInputField.layoutConstraints(top: inputTitleLbl.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 10, left: 15, bottom: 0, right: -15), size: .init(width: 0, height: 50))
        inputDescriptionLbl.layoutConstraints(top: titleInputField.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 30, left: 15, bottom: 0, right: -15))
        descriptionInputField.layoutConstraints(top: inputDescriptionLbl.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 10, left: 15, bottom: 0, right: -15), size: .init(width: 0, height: 120))
        inputPriorityLbl.layoutConstraints(top: descriptionInputField.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 30, left: 15, bottom: 0, right: -15))
        textPriorityView.layoutConstraints(top: inputPriorityLbl.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 10, left: 15, bottom: 0, right: -15), size: .init(width: 0, height: 50))
        priorityTextField.layoutConstraints(top: textPriorityView.topAnchor, leading: textPriorityView.leadingAnchor, bottom: textPriorityView.bottomAnchor, trailing: textPriorityView.trailingAnchor)
    }
    func registerFirst(){
        let imgData = (testImage.image?.pngData()!)!
        let itemOf = TodoItem(title: "Complete the challenge", description: "Complete mobile challenge by awesomity", photo: imgData, priority: "MEDIUM")
        StorageManager.shared.createTodo(with: itemOf) { id in
            print(id)
        } onFail: { error in
            print(error)
        }
    }
    private func tapPriority(){
        priorityDropdown.anchorView = textPriorityView
        priorityDropdown.dataSource = ["LOW", "MEDIUM", "HIGH"]
        priorityDropdown.bottomOffset = CGPoint(x: 0, y:(priorityDropdown.anchorView?.plainView.bounds.height)!)
        priorityDropdown.topOffset = CGPoint(x: 0, y:-(priorityDropdown.anchorView?.plainView.bounds.height)!)
        priorityDropdown.direction = .any
        priorityDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.priorityTextField.text = item
        }
    }
    @objc private func onOpenPriorityDropdown(){
        priorityDropdown.show()
    }
    @objc private func onAddTodo(){
        guard let title = titleInputField.text, title == "", let description = descriptionInputField.text, description == "", let priority = priorityTextField.text, priority != "" else {
            return
        }
        if selectedImageView.image == nil {
            return
        }
        let imgData = (testImage.image?.pngData()!)!
        let newTodo = TodoItem(title: title, description: description, photo: imgData, priority: priority)
        StorageManager.shared.createTodo(with: newTodo) { id in
            print(id)
        } onFail: { error in
            print(error)
        }

    }
}

extension CreateTodoVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = nil
        textView.textColor = .black
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "240 Characters"
            textView.textColor = .gray
        }
    }
}

extension CreateTodoVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc private func imageSourcePicker() {
        let actionSheet = UIAlertController(title: "", message:"How would you like to select your picture", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title:"Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title:"Take Photo", style: .default, handler: { [weak self]_ in
            self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title:"Choose Photo", style: .default, handler: { [weak self]_ in
            self?.presentPhotoLibary()
        }))
        self.present(actionSheet, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            let selectedImg = UIImageView()
            selectedImageView.image = image
            selectedImageView.frame = CGRect(x: 0.0, y: 0.0, width: 250, height: 250)
            selectedImageView.layer.cornerRadius = 10
            tapImageView.addSubview(selectedImg)
        }
        let imgURL = info[UIImagePickerController.InfoKey.imageURL] as! URL
        print(imgURL.lastPathComponent)
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func convertImageToBase64(image: UIImage) -> String {
        let imageData = image.pngData()!
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    func presentCamera(){
        picker.sourceType = .camera
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    func presentPhotoLibary(){
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
}
