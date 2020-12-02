//
//  NextViewController.swift
//  QuestionApp1
//
//  Created by Kenshiro on 2020/11/30.
//

import UIKit

//最高得点の点数をViewControllerにわたすためのプロトコル
protocol scoreMonitoringDelegate {
    func nowScore(score:Int)
}

class NextViewController: UIViewController {

    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    //テストの結果を表示するために用いる変数たち
    var correctedCount = 0
    var wrongedCount = 0
    
    //最高得点を記録する際に用いる変数たち
    var nowMaxScore = 0
        //プロトコルを使うために変数化したもの
    var delegate:scoreMonitoringDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //テスト結果をラベルに表示
        correctLabel.text = String(correctedCount)
        wrongLabel.text = String(wrongedCount)
        
        //UserDefaults内に保存されている最高得点の値をnowMaxScoreに代入
        if UserDefaults.standard.object(forKey: "newRecord") != nil{
            nowMaxScore = UserDefaults.standard.object(forKey: "newRecord") as! Int
        }
    }
    
    @IBAction func back(_ sender: Any) {
        //ViewController内の最高得点に反映させるための値を保存する
            //今回の点数が最高得点だった場合
        if nowMaxScore < correctedCount{
                //最高得点の値を保存する呪文(今回の得点を保存)
            UserDefaults.standard.set(correctedCount, forKey: "newRecord")
            delegate?.nowScore(score: correctedCount)
        }
            //今回の得点が最高得点でなかった場合
        else if nowMaxScore >= correctedCount{
            UserDefaults.standard.set(nowMaxScore, forKey: "newRecord")
        }
        //    画面遷移を戻る呪文(現在の最高得点を引き続き保存)
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
