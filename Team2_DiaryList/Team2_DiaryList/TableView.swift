//
//  TableView.swift
//  Team2_DiaryList
//
//  Created by 이민호 on 11/23/23.
//

import UIKit
import SwiftUI

class TableView: UITableViewController {
    var viewModel = DiaryViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "일기 목록"
        self.navigationItem.leftBarButtonItem = editButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(AddButtonClick))
    }
    
    @objc func AddButtonClick() {
        // 사용시 TestView() 수정
        let addView = AddDiaryView()
        addView.modalPresentationStyle = .fullScreen
        
        addView.viewModel = self.viewModel
        addView.tableView = self.tableView
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
        return self.viewModel.diaryList.count
    }
    
    // Cell 지정
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DiaryCell.identifier, for: indexPath) as! DiaryCell
        let data = self.viewModel.diaryList[indexPath.row]
        
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
        let movedItem = self.viewModel.diaryList.remove(at: sourceIndexPath.row)
        self.viewModel.diaryList.insert(movedItem, at: destinationIndexPath.row)
    }
    
    // 테이블 삭제
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.viewModel.diaryList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // 필요한 경우 추가 구현
        }
    }
}

