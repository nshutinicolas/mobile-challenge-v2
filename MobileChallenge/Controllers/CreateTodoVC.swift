//
//  CreateTodoVC.swift
//  MobileChallenge
//
//  Created by Musoni nshuti Nicolas on 02/02/2022.
//

import UIKit
import DropDown
import CloudKit
import PhotosUI

class CreateTodoVC: UIViewController {
    let priorityDropdown = DropDown()
    let scrollView = UIScrollView()
    let wrappingView = UIView()
    let titleLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .bold)
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
    var selectedImageView = UIImageView()
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
        textField.font = .systemFont(ofSize: 16)
        return textField
    }()
    let pickeImgPlaceholder: UILabel = {
        let label = UILabel()
        label.text = "tap to add image"
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
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
        textView.font = .systemFont(ofSize: 16)
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
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9607843137, blue: 0.9647058824, alpha: 1)
        return view
    }()
    let priorityTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Select priority"
        textField.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9607843137, blue: 0.9647058824, alpha: 1)
        textField.layer.cornerRadius = 4
        textField.isUserInteractionEnabled = false
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
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(createTodo), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { [unowned self] (status) in
            DispatchQueue.main.async { [unowned self] in
                permissionStatus(for: status)
            }
        }
        picker.delegate = self
        tapPriority()
        view.backgroundColor = .systemBackground
        descriptionInputField.delegate = self
        let openImageSource = UITapGestureRecognizer(target: self, action: #selector(imageSourcePicker))
        tapImageView.addGestureRecognizer(openImageSource)
        let priorityTap = UITapGestureRecognizer(target: self, action: #selector(onOpenPriorityDropdown))
        textPriorityView.addGestureRecognizer(priorityTap)
//        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
    private func permissionStatus(for status: PHAuthorizationStatus) {
        switch status {
        case .authorized:
            print("authorized")
            break
        case .limited:
            print("limited access")
            break
        case .denied:
            print("denied")
            break
        case .notDetermined:
            print("no sure")
            break
        case .restricted:
            print("restricted")
            break
        @unknown default:
            print("now this")
            break
        }
    }
    private func backButton(){
        navigationController?.popViewController(animated: true)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.frame = view.bounds
        view.addSubview(scrollView)
        scrollView.addSubview(wrappingView)
        scrollView.showsVerticalScrollIndicator = false
        [titleLbl,addImageLbl,tapImageView, inputTitleLbl, titleInputField, inputDescriptionLbl, descriptionInputField, inputPriorityLbl, textPriorityView, addTodoBtn].forEach { item in
            wrappingView.addSubview(item)
        }
        tapImageView.addSubview(pickeImgPlaceholder)
        tapImageView.addSubview(selectedImageView)
        selectedImageView.contentMode = .scaleAspectFit
//        selectedImageView.image = UIImage(named: "IB_logo")
        scrollView.layoutConstraints(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        wrappingView.layoutConstraints(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor)
        wrappingView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        textPriorityView.addSubview(priorityTextField)
        titleLbl.layoutConstraints(top: wrappingView.topAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 15, left: 20, bottom: 0, right: -20))
        addImageLbl.layoutConstraints(top: titleLbl.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 30, left: 20, bottom: 0, right: -15))
        tapImageView.layoutConstraints(top: addImageLbl.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 10, left: 15, bottom: 0, right: -15), size: .init(width: 0, height: 150))
        inputTitleLbl.layoutConstraints(top: tapImageView.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 30, left: 15, bottom: 0, right: -15))
        titleInputField.layoutConstraints(top: inputTitleLbl.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 10, left: 15, bottom: 0, right: -15), size: .init(width: 0, height: 50))
        inputDescriptionLbl.layoutConstraints(top: titleInputField.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 30, left: 15, bottom: 0, right: -15))
        descriptionInputField.layoutConstraints(top: inputDescriptionLbl.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 10, left: 15, bottom: 0, right: -15), size: .init(width: 0, height: 120))
        inputPriorityLbl.layoutConstraints(top: descriptionInputField.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 30, left: 15, bottom: 0, right: -15))
        textPriorityView.layoutConstraints(top: inputPriorityLbl.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: nil, trailing: wrappingView.trailingAnchor, padding: .init(top: 10, left: 15, bottom: 0, right: -15), size: .init(width: 0, height: 50))
        priorityTextField.layoutConstraints(top: textPriorityView.topAnchor, leading: textPriorityView.leadingAnchor, bottom: textPriorityView.bottomAnchor, trailing: textPriorityView.trailingAnchor)
        addTodoBtn.layoutConstraints(top: textPriorityView.bottomAnchor, leading: wrappingView.leadingAnchor, bottom: wrappingView.bottomAnchor, trailing: nil, padding: .init(top: 20, left: 15, bottom: -30, right: 0), size: .init(width: 150, height: 50))
        selectedImageView.layoutConstraints(top: tapImageView.topAnchor, leading: tapImageView.leadingAnchor, bottom: tapImageView.bottomAnchor, trailing: tapImageView.trailingAnchor)
        pickeImgPlaceholder.layoutConstraints(top: nil, leading: tapImageView.leadingAnchor, bottom: nil, trailing: tapImageView.trailingAnchor)
        pickeImgPlaceholder.centerYAnchor.constraint(equalTo: tapImageView.centerYAnchor).isActive = true
    }

    private func tapPriority(){
        priorityDropdown.anchorView = textPriorityView
        priorityDropdown.dataSource = ["low", "medium", "high"]
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
        print("clicked")
    }
    @objc private func createTodo(){
        guard let title = titleInputField.text, title != "", let description = descriptionInputField.text, description != "", let priority = priorityTextField.text, priority != "" else {
            print("some values missing")
            return
        }
        if selectedImageView.image == nil {
            print("noImage")
            return
        }
        let imgData = (selectedImageView.image?.pngData()!)!
        let newTodo = TodoItem(title: title, description: description, photo: imgData, priority: priority)
        StorageManager.shared.createTodo(with: newTodo) { [weak self] id in
            print(id)
            self?.navigationController?.popViewController(animated: true)
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
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            pickeImgPlaceholder.isHidden = true
            selectedImageView.image = image
            print("selected image")
        }
        let imgURL = info[UIImagePickerController.InfoKey.imageURL] as! URL
        print(imgURL.lastPathComponent)
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        print("cancelled")
    }
    func presentCamera(){
        picker.sourceType = .camera
        picker.allowsEditing = false
        present(picker, animated: true, completion: nil)
    }
    func presentPhotoLibary(){
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        present(picker, animated: true, completion: nil)
    }
}
