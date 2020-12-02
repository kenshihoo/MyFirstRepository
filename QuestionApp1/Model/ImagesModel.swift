//
//  ImagesModel.swift
//  QuestionApp1
//
//  Created by Kenshiro on 2020/12/01.
//

import Foundation

class ImagesModel{
// 画像名を取得し、その画像名から人間か否かをフラグによって判断するための機能
    
    let imageTexit:String
    let answer:Bool
    //クラスを初期化(initialize)するためのメソッド←funcが不要
        //クラス内のすべてのインスタンスを初期化する必要がある
    init(imageName:String,crrectOrNot:Bool){
        
        imageTexit = imageName
        answer = crrectOrNot
    }
    
    
    
}
