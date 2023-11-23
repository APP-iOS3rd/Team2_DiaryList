//
//  AddDiaryView.swift
//  Team2_DiaryList
//
//  Created by 노주영 on 2023/11/23.
//

import UIKit

class AddDiaryView: UIViewController {
    
    var viewModel = DiaryViewModel()
    
    let backButton: UIButton = {
       let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let saveButton: UIButton = {
       let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray5
        textField.placeholder = " 제목"
        textField.textColor = .black
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 30)
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let detailTextView: UITextView = {
       let textView = UITextView()
        textView.textColor = UIColor.black
        textView.font = UIFont.systemFont(ofSize: 30)
        textView.textAlignment = .left
        textView.backgroundColor = .systemGray5
        textView.layer.cornerRadius = 10
        textView.layer.masksToBounds = true
        textView.layer.borderWidth = 0
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.uiCreate()
    }
}

//MARK: 액션 메소드
extension AddDiaryView {
    //MARK: tap 제스쳐
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func gpBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @objc func saveDiary(_ sender: UIButton) {
        self.viewModel.saveDiary(title: self.titleTextField.text, detail: self.detailTextView.text)
    }
}

//MARK: 뷰 그리기
extension AddDiaryView {
    func uiCreate(){
        self.view.backgroundColor = .systemBackground
        
        self.saveButton.addTarget(self, action: #selector(saveDiary(_:)), for: .touchUpInside)
        
        self.view.addSubview(self.backButton)
        self.view.addSubview(self.saveButton)
        self.view.addSubview(self.titleTextField)
        self.view.addSubview(self.detailTextView)
        
        NSLayoutConstraint.activate([
            self.backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.backButton.widthAnchor.constraint(equalToConstant: 80),
            self.backButton.heightAnchor.constraint(equalToConstant: 50),
            
            self.saveButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.saveButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.saveButton.widthAnchor.constraint(equalToConstant: 80),
            self.saveButton.heightAnchor.constraint(equalToConstant: 50),
            
            self.titleTextField.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: 30),
            self.titleTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.titleTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.titleTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.detailTextView.topAnchor.constraint(equalTo: self.titleTextField.bottomAnchor, constant: 30),
            self.detailTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.detailTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.detailTextView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
}
