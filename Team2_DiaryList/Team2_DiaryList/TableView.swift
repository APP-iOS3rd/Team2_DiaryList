//
//  TableView.swift
//  Team2_DiaryList
//
//  Created by 이민호 on 11/23/23.
//

import UIKit
import SwiftUI

class TableView: UITableViewController {
    var asd: [DiaryModel] = [
       DiaryModel.init(title: "asd", detail: "sadsdwqwrqeqrewqwfqwfqwfwqfwqwfqwfqwfqwfqwfqwfqqwfqfwfwqwffqwfwqfqwfqwfqwfw", date: Date()),
       DiaryModel.init(title: "qwe", detail: "sadsdwqwrqeqrewqwfqwfqwfwqfwqwfqwfqwfqwfqwfqwfqqwfqfwfwqwffqwfwqfqwfqwfqwfw", date: Date()),
       DiaryModel.init(title: "asd", detail: "sadsdwqwrqeqrewqwfqwfqwfwqfwqwfqwfqwfqwfqwfqwfqqwfqfwfwqwffqwfwqfqwfqwfqwfw", date: Date()),
       DiaryModel.init(title: "qwe", detail: "sadsdwqwrqeqrewqwfqwfqwfwqfwqwfqwfqwfqwfqwfqwfqqwfqfwfwqwffqwfwqfqwfqwfqwfadkfjaskdjflkasjfdlaskjdflkasjdflkasjflkasjdflkajsdflkjasldkfjlaksjdf;asjdflkajs;dlfkjas;lkdfjlaskjfdlkasjdlf;kjas;lkdfj;aslkjfd;lkasjdf;lkasjdf;lkj;lkasd\n", date: Date())
   ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "일기 목록"
        self.navigationItem.leftBarButtonItem = editButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(AddButtonClick))
    }
    
    @objc func AddButtonClick() {
        // 사용시 TestView() 수정
        let addView = TestView()
        addView.modalPresentationStyle = .fullScreen
        self.present(addView, animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
        
    override func loadView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DiaryCell.self, forCellReuseIdentifier: DiaryCell.identifier)
        view = tableView
    }
}

extension TableView {
    // cell 개수 설정
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return asd.count
    }
    
    // Cell 지정
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DiaryCell.identifier, for: indexPath) as! DiaryCell
        let data = asd[indexPath.row]
        
        cell.configure(title: data.title, date: data.date, content: data.detail)
        return cell
    }
    
    // 테이블 Cell 높이 지정
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // 편집 모드에서 셀의 이동을 가능하게 합니다.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 셀의 위치를 변경하고 데이터를 업데이트합니다.
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedItem = asd.remove(at: sourceIndexPath.row)
        asd.insert(movedItem, at: destinationIndexPath.row)
    }
    
    // 테이블 삭제
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            asd.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // 필요한 경우 추가 구현
        }
    }
}

struct TableView_Preview: PreviewProvider {
    static var previews: some View {
        TableView().showPreview()
    }
}
