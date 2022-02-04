//
//  TodoItemCellTableViewCell.swift
//  MobileChallenge
//
//  Created by Musoni nshuti Nicolas on 02/02/2022.
//

import UIKit

class TodoItemCellTableViewCell: UITableViewCell {
    
    let statusImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "checkmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 10, weight: .light, scale:  .default))
        image.tintColor = .black
        image.layer.cornerRadius = 2
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 2
        image.contentMode = .center
        return image
    }()
    let titleLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    let statusLbl: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.backgroundColor = .black
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    let createdAtLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    let updatedAtLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
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
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func initCell(){
        [statusImage, titleLbl, statusLbl, writeDateStack].forEach { item in
            addSubview(item)
        }
        writeDateStack.addArrangedSubview(createdAtLbl)
        writeDateStack.addArrangedSubview(updatedAtLbl)
        statusImage.layoutConstraints(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 15, left: 20, bottom: 0, right: 0), size: .init(width: 20, height: 20))
        titleLbl.layoutConstraints(top: topAnchor, leading: statusImage.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 15, bottom: 0, right: -10))
        statusLbl.layoutConstraints(top: titleLbl.bottomAnchor, leading: statusImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 15, left: 15, bottom: 0, right: -10))
        writeDateStack.layoutConstraints(top: statusLbl.bottomAnchor, leading: statusImage.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 15, left: 15, bottom: 0, right: -10))
    }
    public func updateValues(with info: TodoItem){

    }
}
