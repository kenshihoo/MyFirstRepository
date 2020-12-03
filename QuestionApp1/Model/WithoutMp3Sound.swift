//
//      WithoutMp3.swift
//  QuestionApp1
//
//  Created by Kenshiro on 2020/12/02.
//

import Foundation

class withoutMP3Sound: soundFile{
    override func playSound(fileName: String, extensionName: String) {
        if extensionName == "mp3"{
            print("このファイルは再生できません")
            
        }
        player?.stop()
    }
}

