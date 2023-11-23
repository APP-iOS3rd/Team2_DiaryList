//
//  DiaryCell.swift
//  Team2_DiaryList
//
//  Created by 이민호 on 11/23/23.
//

//
//  GameListCell.swift
//  UIkit_Tutorial
//
//  Created by 이민호 on 2023/11/13.
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
        contentView.addSubview(title)
        contentView.addSubview(diaryDate)
        contentView.addSubview(content)
                
        title.translatesAutoresizingMaskIntoConstraints = false
        diaryDate.translatesAutoresizingMaskIntoConstraints = false
        content.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            title.trailingAnchor.constraint(equalTo: diaryDate.leadingAnchor, constant: -10),
            title.widthAnchor.constraint(equalToConstant: 50),
            title.heightAnchor.constraint(equalToConstant: 30),
            
            diaryDate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            diaryDate.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 10),
            diaryDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            diaryDate.heightAnchor.constraint(equalToConstant: 30),
            diaryDate.widthAnchor.constraint(equalToConstant: 50),
            
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
        title.text = "일기1"
        title.font = UIFont.systemFont(ofSize: 20)
        title.textAlignment = .left
    }
    
    func setUpDate() {
        diaryDate.textColor = .black
        diaryDate.text = "2023.11.12"
        diaryDate.font = UIFont.systemFont(ofSize: 20)
        title.textAlignment = .right
    }
    
    func setupContent() {
        content.textColor = .black
        content.text = """
                asdfsadfasdfsadfsdfasdfasdfasdfasdfasdfa
                asdfsadfasdfsadf
                asdfsadfasdfsadf
        """
        content.font = UIFont.systemFont(ofSize: 15)
        content.textAlignment = .left
        
    }
    
    func configure(title: String, date: Date, content: String) {
        self.title.text = title
        self.content.text = content
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
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
