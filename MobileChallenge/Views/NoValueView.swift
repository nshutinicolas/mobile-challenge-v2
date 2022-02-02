//
//  NoValueView.swift
//  MobileChallenge
//
//  Created by Musoni nshuti Nicolas on 02/02/2022.
//

import UIKit

class NoValueView: UIView {
    
    let welcomeLbl: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        return label
    }()
    let totalTasksView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.4
        view.backgroundColor = .blue
        view.layer.shadowRadius = 2
        return view
    }()
    let activeTaskView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.4
        view.layer.shadowRadius = 2
        view.backgroundColor = .black
        return view
    }()
    let tasksDoneView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.4
        view.backgroundColor = .yellow
        view.layer.shadowRadius = 2
        return view
    }()
    let activeHighTasksView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.4
        view.layer.shadowRadius = 2
        view.backgroundColor = .systemPink
        return view
    }()
    let topStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        return stack
    }()
    let bottomStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        return stack
    }()
    let nothingLbl: UILabel = {
        let label = UILabel()
        label.text = "NOTHING HERE"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    let nothingDescriptionLbl: UILabel = {
        let label = UILabel()
        label.text = "My crush has no phone!!"
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.textAlignment = .center
        return label
    }()
    let startHereBtn: UIButton = {
        let button = UIButton()
        button.setTitle("START WITH A NEW TASK", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .black
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView(){
//        addSubview(welcomeLbl)
        addSubview(topStackView)
        addSubview(bottomStackView)
        addSubview(nothingLbl)
        addSubview(nothingDescriptionLbl)
        topStackView.addArrangedSubview(totalTasksView)
        topStackView.addArrangedSubview(activeTaskView)
        bottomStackView.addArrangedSubview(tasksDoneView)
        bottomStackView.addArrangedSubview(activeHighTasksView)
//        welcomeLbl.layoutConstraints(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: -20), size: .init(width: 0, height: 40))
        topStackView.layoutConstraints(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 40, left: 10, bottom: 0, right: -10), size: .init(width: 0, height: 100))
        totalTasksView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.42).isActive = true
        bottomStackView.layoutConstraints(top: topStackView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 10, bottom: 0, right: -10), size: .init(width: 0, height: 100))
        tasksDoneView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.42).isActive = true
        nothingLbl.layoutConstraints(top: bottomStackView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 40, left: 20, bottom: 0, right: -20))
        nothingDescriptionLbl.layoutConstraints(top: nothingLbl.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 15, left: 20, bottom: 0, right: -20))
    }
    
}
