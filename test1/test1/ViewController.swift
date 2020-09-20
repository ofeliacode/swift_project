//  ViewController.swift
//  test1
//
//  Created by Офелия Баширова on 26.08.2020.
//  Copyright © 2020 Офелия Баширова. All rights reserved.

import UIKit
import SnapKit
import Rswift

class CreateAlbum: UIViewController, UITextFieldDelegate {
    
    let line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.969, alpha: 1)
        return line
    }()
    //линия2
    let line2: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.969, alpha: 1)
        return line
    }()
    
    //главный экран
    
    // кнопка отменить
    let cancelBtn: UIButton = {
         let button = UIButton(frame: CGRect(x: 20, y: 12, width: 100, height: 50))
               button.setTitleColor(UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), for: .normal)
               button.setTitle(R.string.loc.test(), for: .normal)
               button.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
               return button
    }()
    //кнопка создать
    let saveBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 12, width: 100, height: 50))
        button.setTitleColor(UIColor(red: 0.541, green: 0.541, blue: 0.561, alpha: 1), for: .normal)
        button.setTitle(R.string.loc.create(), for: .normal)
        button.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)

       return button
    }()
    @objc func saveAction(sender: UIButton!) {
      print("Button tapped")
    }
    @objc func cancelAction(sender: UIButton!) {
         print("Button tapped")
       }
    //Новый альбом
    let labelText: UILabel = {
           let label = UILabel()
           label.text = (R.string.loc.newalbum())
           label.textAlignment = .center
           label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
           return label
       }()
    
    // инпут - Название альбома
    let nameOfAlbumText: UITextField = {
        let textfield = UITextField()
           textfield.font = UIFont.systemFont(ofSize: 17)
           textfield.attributedPlaceholder = NSAttributedString(string: R.string.loc.name(),
                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.541, green: 0.541, blue: 0.561, alpha: 1)])
           textfield.borderStyle = .none
           textfield.backgroundColor = .white
           textfield.layer.cornerRadius = 13
           textfield.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner];
            let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
            textfield.leftView = leftView
            textfield.leftViewMode = .always
           return textfield
       }()
    
    //инпут -список
    let listText: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont.systemFont(ofSize: 17)
        textfield.borderStyle = .none
        textfield.backgroundColor = .white
        textfield.attributedPlaceholder = NSAttributedString(string: R.string.loc.list(),
               attributes: [NSAttributedString.Key.foregroundColor: UIColor(ciColor: .black)])
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        textfield.leftView = leftView
        textfield.leftViewMode = .always
        return textfield
    }()
    // инпут - участники
    let participantText: UITextField = {
     let textfield = UITextField()
        textfield.font = UIFont.systemFont(ofSize: 17)
        textfield.attributedPlaceholder = NSAttributedString(string: R.string.loc.participants(),
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor(ciColor: .black)])
        textfield.borderStyle = .none
        textfield.layer.cornerRadius = 13
        textfield.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner];
        textfield.backgroundColor = .white
        textfield.rightViewMode = UITextField.ViewMode.always
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        textfield.leftView = leftView
        textfield.leftViewMode = .always
        return textfield
    }()
    
    //стэк всех инпутов
    func mainStackView() -> UIStackView {
           let stackView = UIStackView(arrangedSubviews: [nameOfAlbumText, listText, participantText])
           stackView.axis = .vertical
           stackView.distribution = .fillEqually
           stackView.spacing = 0
           return stackView
    }
    
    //инпут - 101 group
    let projectsText: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont.systemFont(ofSize: 17)
        textfield.attributedPlaceholder = NSAttributedString(string: R.string.loc.project(),
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor(ciColor: .black)])
       
        textfield.borderStyle = .none
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 13
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        textfield.leftView = leftView
        textfield.leftViewMode = .always
        return textfield
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupViews()
        self.view.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.969, alpha: 1)
    }
    
    func setup() {
        view.backgroundColor = .white
        title = "Новый альбом"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    //констрейнты
    func setupViews() {
        let stackView = mainStackView()
        view.addSubview(stackView)
        view.addSubview(cancelBtn)
        view.addSubview(saveBtn)
        view.addSubview(labelText)
       view.addSubview(projectsText)
        view.addSubview(line)
        view.addSubview(line2)
        view.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        stackView.snp.makeConstraints { make in
            make.bottom.equalTo(-623)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.height.equalTo(150)
            make.centerX.equalTo(self.view)
           
        }
        cancelBtn.snp.makeConstraints { make in
         make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-15)
            make.left.equalTo(12)
            make.bottom.equalTo(stackView.snp.top)
        }
        saveBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-15)
            make.right.equalTo(-12)
            make.bottom.equalTo(stackView.snp.top)
        }
        labelText.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
        }
        projectsText.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stackView.snp.bottom).offset(24)
            make.width.equalTo(351)
            make.height.equalTo(50)
            make.left.equalTo(12)
        }
        line.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(120)
                    make.left.equalTo(23)
                    make.right.equalTo(-12)
                    make.width.equalTo(345)
                    make.height.equalTo(2)
        }
        line2.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(170)
                    make.left.equalTo(23)
                    make.right.equalTo(-12)
                    make.width.equalTo(345)
                    make.height.equalTo(2)
        }
    }
}
