//
//  imagesList.swift
//  QuestionApp1
//
//  Created by Kenshiro on 2020/12/01.
//

import Foundation

class ImagesList{
    var list = [ImagesModel]()
    
    //初期化してlost内にimageNameと人間か否かの答えの情報を入れる
    init() {
        list.append(ImagesModel(imageName: "0", crrectOrNot: true))
        list.append(ImagesModel(imageName: "1", crrectOrNot: false))
        list.append(ImagesModel(imageName: "2", crrectOrNot: false))
        list.append(ImagesModel(imageName: "3", crrectOrNot: false))
        list.append(ImagesModel(imageName: "4", crrectOrNot: true))
        list.append(ImagesModel(imageName: "5", crrectOrNot: false))
        list.append(ImagesModel(imageName: "6", crrectOrNot: true))
        list.append(ImagesModel(imageName: "7", crrectOrNot: true))
        list.append(ImagesModel(imageName: "8", crrectOrNot: false))
        list.append(ImagesModel(imageName: "9", crrectOrNot: true))
        list.append(ImagesModel(imageName: "10", crrectOrNot: true))
    }
    
}
