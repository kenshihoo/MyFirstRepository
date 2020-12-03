//
//  SoundFile.swift
//  QuestionApp1
//
//  Created by Kenshiro on 2020/12/02.
//

import Foundation
//音声を使うためのメソッドを呼び出した
import AVFoundation

class soundFile{
    var player:AVAudioPlayer?
    
    func playSound(fileName:String,extensionName:String){
        //再生する音声を指定する
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extensionName)
//DoCatch文(通常Do内の動きをするが、エラーが出た場合にはCatch内の挙動をする)
        do{
            //音声を鳴らす
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
        }
        catch{
            print("エラーです")
        }
    }
    
}
