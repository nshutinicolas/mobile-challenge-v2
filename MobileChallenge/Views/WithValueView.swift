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
        view.backgroundColor = .systemBackground
        return view
    }()
    let activeTaskLbl: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.7568627451, green: 0.8117647059, blue: 0.0862745098, alpha: 1)
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    let activeLowerLbl: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.09803921569, green: 0.1568627451, blue: 0.2078431373, alpha: 1)
        label.text = "Active Tasks"
        label.font = .systemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    let tasksDoneView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.4
        view.backgroundColor = .systemBackground
        view.layer.shadowRadius = 2
        return view
    }()
    let doneTaskLbl: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.7568627451, green: 0.8117647059, blue: 0.0862745098, alpha: 1)
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    let doneLowerLbl: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.09803921569, green: 0.1568627451, blue: 0.2078431373, alpha: 1)
        label.text = "Tasks Done"
        label.font = .systemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    let totalTasksView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.4
        view.backgroundColor = .systemBackground
        view.layer.shadowRadius = 2
        return view
    }()
    let totalTaskLbl: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.7568627451, green: 0.8117647059, blue: 0.0862745098, alpha: 1)
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    let totalLowerLbl: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Total Tasks"
        label.font = .systemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        return label
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
        
        totalTasksView.addSubview(totalTaskLbl)
        totalTasksView.addSubview(totalLowerLbl)
        totalTaskLbl.layoutConstraints(top: totalTasksView.topAnchor, leading: totalTasksView.leadingAnchor, bottom: nil, trailing: totalTasksView.trailingAnchor, padding: .init(top: 10, left: 15, bottom: 0, right: -15))
        totalLowerLbl.layoutConstraints(top: totalTaskLbl.bottomAnchor, leading: totalTasksView.leadingAnchor, bottom: nil, trailing: totalTasksView.trailingAnchor, padding: .init(top: 6, left: 15, bottom: 0, right: -15))
        
        activeTaskView.addSubview(activeTaskLbl)
        activeTaskView.addSubview(activeLowerLbl)
        activeTaskLbl.layoutConstraints(top: activeTaskView.topAnchor, leading: activeTaskView.leadingAnchor, bottom: nil, trailing: activeTaskView.trailingAnchor, padding: .init(top: 10, left: 15, bottom: 0, right: -15))
        activeLowerLbl.layoutConstraints(top: activeTaskLbl.bottomAnchor, leading: activeTaskView.leadingAnchor, bottom: nil, trailing: activeTaskView.trailingAnchor, padding: .init(top: 6, left: 15, bottom: 0, right: -15))
        
        tasksDoneView.addSubview(doneTaskLbl)
        tasksDoneView.addSubview(doneLowerLbl)
        doneTaskLbl.layoutConstraints(top: tasksDoneView.topAnchor, leading: tasksDoneView.leadingAnchor, bottom: nil, trailing: tasksDoneView.trailingAnchor, padding: .init(top: 10, left: 15, bottom: 0, right: -15))
        doneLowerLbl.layoutConstraints(top: doneTaskLbl.bottomAnchor, leading: tasksDoneView.leadingAnchor, bottom: nil, trailing: tasksDoneView.trailingAnchor, padding: .init(top: 6, left: 15, bottom: 0, right: -15))
    }
    public func updateValues(){
        
    }
}
