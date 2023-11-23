//
//  DiaryViewModel.swift
//  Team2_DiaryList
//
//  Created by 노주영 on 2023/11/23.
//

import Foundation

class DiaryViewModel {
    var diaryList: [DiaryModel] = [] //리스트에 viewWill거기서 데이터 받아오기

    func saveDiary(title: String, detail: String, databasePath: String) {

        if title != "" && detail != "" {

            let currentDate = Date()
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy-MM-dd"
            let formattedDate = dateFormater.string(from: currentDate)
            
            let contactDB = FMDatabase(path: databasePath)
            dump(databasePath)
            if contactDB.open() {
              
                let isDataExistQuery = "SELECT EXISTS (SELECT 1 FROM T_Diary WHERE title = ?)"
                
                do {
                    let resultSet = try contactDB.executeQuery(isDataExistQuery, values: [title])
                    
                    if resultSet.next(), resultSet.bool(forColumnIndex: 0) {
                        // 데이터가 존재하면 UPDATE 수행
                        let updateQuery = "UPDATE T_Diary SET title = ?, detail = ?, date = ? WHERE title = ?"
                        try contactDB.executeUpdate(updateQuery, values: [title, detail,formattedDate, title])
                    } else {
                        // 데이터가 존재하지 않으면 INSERT 수행
                        let insertQuery = "INSERT INTO T_Diary (title, detail, date) VALUES (?, ?, ?)"
                        try contactDB.executeUpdate(insertQuery, values: [title, detail,formattedDate])
                        self.diaryList.append(DiaryModel(title: title, detail: detail, date: formattedDate))
                    }
                    
                } catch {
                    print("contact 추가 실패!!")
                }
                
//                status.text = "Contact Added"
//                name.text = ""
//                address.text = ""
//                phone.text = ""
//                email.text = ""
                
                contactDB.close()
            } else {
                print( "DB 열기 오류발생")
                print("Error: \(contactDB.lastErrorMessage())")
            }
        }
    }
}

