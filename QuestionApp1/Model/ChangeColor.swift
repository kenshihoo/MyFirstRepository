//
//  CangeColor.swift
//  QuestionApp1
//
//  Created by Kenshiro on 2020/12/03.
//

import Foundation
//ここでは色を使うのでUIKitをインポートした
import UIKit

class changeColor{
    func changeBackColor(topR:CGFloat,topG:CGFloat,topB:CGFloat,topAlpha:CGFloat,bottomR:CGFloat,bottomG:CGFloat,bottomB:CGFloat,bottomAlpha:CGFloat) -> CAGradientLayer{
        
        //グラデーション開始時の色を決める
        let toptColor = UIColor(red: topR, green: topG, blue: topB, alpha: topAlpha)
        
        //グラデーション終了時の色を決める
        let bottomColor = UIColor(red: bottomR, green: bottomG, blue: bottomB, alpha: bottomAlpha)
        
        //グラデーションの色を配列で管理
        let gradientColor = [toptColor.cgColor,bottomColor.cgColor]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColor
        
        return gradientLayer
    
    }
}
