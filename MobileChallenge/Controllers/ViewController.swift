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
        view.backgroundColor = .black
        return view
    }()
    let topLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "IW_logo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    let filterBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.contentMode = .scaleAspectFit
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
    override func viewDidLoad() {
        super.viewDidLoad()
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
        headerView.layoutConstraints(top: view.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, size: .init(width: 0, height: 250))
        topLogo.layoutConstraints(top: view.safeAreaLayoutGuide.topAnchor, leading: headerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 20, bottom: 0, right: 0), size: .init(width: 40, height: 40))
        filterBtn.layoutConstraints(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: headerView.trailingAnchor, padding: .init(top: 6, left: 0, bottom: 0, right: -20), size: .init(width: 30, height: 30))
        searchBtn.layoutConstraints(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: filterBtn.trailingAnchor, padding: .init(top: 6, left: 0, bottom: 0, right: -20), size: .init(width: 30, height: 30))
    }

}

