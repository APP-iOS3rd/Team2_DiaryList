//
//  DiaryCell.swift
//  Team2_DiaryList
//
//  Created by 이민호 on 11/23/23.
//

import UIKit
import SwiftUI


class DiaryCell: UITableViewCell {
    static let identifier = "cell"
    
    private var title : UILabel!
    private var diaryDate : UILabel!
    private var content: UILabel!
                               
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        config()
        setUpLayout()
    }
            
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    func config() {
        title = UILabel()
        diaryDate = UILabel()
        content = UILabel()
                
        title.translatesAutoresizingMaskIntoConstraints = false
        diaryDate.translatesAutoresizingMaskIntoConstraints = false
        content.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(diaryDate)
        contentView.addSubview(title)
        contentView.addSubview(content)
        
        NSLayoutConstraint.activate([
            diaryDate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            diaryDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            diaryDate.widthAnchor.constraint(equalToConstant: 120),
            diaryDate.heightAnchor.constraint(equalToConstant: 30),
            
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: diaryDate.leadingAnchor, constant: -10),
            title.heightAnchor.constraint(equalToConstant: 30),
            
            content.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            content.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            content.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    func setUpLayout() {
        setUptitle()
        setUpDate()
        setupContent()
    }
    
    func setUptitle() {
        title.textColor = .black
        title.text = ""
        title.font = UIFont.systemFont(ofSize: 20)
        title.textAlignment = .left
        title.numberOfLines = 0
    }
    
    func setUpDate() {
        diaryDate.textColor = .black
        diaryDate.text = ""
        diaryDate.font = UIFont.systemFont(ofSize: 15)
        diaryDate.textAlignment = .right
        diaryDate.numberOfLines = 0
    }
    
    func setupContent() {
        content.textColor = .black
        content.text = ""
        content.font = UIFont.systemFont(ofSize: 15)
        content.textAlignment = .left
        content.numberOfLines = 0
        
    }
    
    func configure(title: String, date: Date, content: String) {
        self.title.text = title
        self.content.text = content
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let fixDate = "\(formatter.string(from: date))"
        self.diaryDate.text = fixDate
    }
    
}

struct CustomCellPreview: PreviewProvider {
    static var previews: some View {
        CellPreviewContainer().frame(width: UIScreen.main.bounds.width, height: 400, alignment: .center)
    }

    struct CellPreviewContainer: UIViewRepresentable {

        func makeUIView(context: UIViewRepresentableContext<CustomCellPreview.CellPreviewContainer>) -> UITableViewCell {
           
            let diaryCell = DiaryCell()
            return diaryCell
        }

        func updateUIView(_ uiView: UITableViewCell, context:
                          UIViewRepresentableContext<CustomCellPreview.CellPreviewContainer>) {

        }

        typealias UIViewType = UITableViewCell
    }
}
