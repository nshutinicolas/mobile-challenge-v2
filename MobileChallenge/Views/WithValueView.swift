//
//  WithValueView.swift
//  MobileChallenge
//
//  Created by Musoni nshuti Nicolas on 02/02/2022.
//

import UIKit

class WithValueView: UIView {
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
    let topStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 4
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func initView(){
        addSubview(topStackView)
        topStackView.addArrangedSubview(totalTasksView)
        topStackView.addArrangedSubview(activeTaskView)
        topStackView.addArrangedSubview(tasksDoneView)
        topStackView.layoutConstraints(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: -10), size: .init(width: 0, height: 60))
        totalTasksView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
    }
    public func updateValues(){
        
    }
}
