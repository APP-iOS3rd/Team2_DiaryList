//
//  DiaryViewModel.swift
//  Team2_DiaryList
//
//  Created by 노주영 on 2023/11/23.
//

import Foundation

class DiaryViewModel {
    var diaryList: [DiaryModel] = [] //리스트에 viewWill거기서 데이터 받아오기
    
    func saveDiary(title: String, detail: String) {
        if title != "" && detail != "" {
            //TODO: DiaryModel.init(title: "제목", detail: "내영", date: Date())을 diarList에 넣고, sqlite에 넣기
        }
    }
}
