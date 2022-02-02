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
        image.image = UIImage(systemName: "tick")
        return image
    }()
    let titleLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    let statusLbl: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.backgroundColor = .black
        label.textColor = .white
        return label
    }()
    let createdAtLbl: UILabel = {
        let label = UILabel()
        return label
    }()
    let updatedAtLbl: UILabel = {
        let label = UILabel()
        return label
    }()
    private func initCell(){
        
    }
}
