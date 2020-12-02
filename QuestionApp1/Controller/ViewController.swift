//
//  ViewController.swift
//  QuestionApp1
//
//  Created by Kenshiro on 2020/11/29.
//

import UIKit

class ViewController: UIViewController,scoreMonitoringDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var maxScoreLabel: UILabel!
    
    var correctCount = 0
    var wrongCount = 0
    var maxScore = 0
    var questionNumber = 0
    
    //Model内のImagesListを使うための宣言
    let imagesList = ImagesList()
    
    //IBActionで検知した回答が正誤を判断するときに用いる変数
    var pickedAnswer:Bool!
    
    //scoreMonitoringDelegateで使うメソッド
    func nowScore(score: Int) {
        maxScoreLabel.text = String(score)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //クラスの継承に必要な呪文(モーダルでViewControllerに戻ってきたときに使う)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        //ViewControllerに戻ってきたときに最初に表示する画像を指定
        imageView.image = UIImage(named: imagesList.list[0].imageTexit)
        
        //最高得点の値を最高得点の表示部分に反映
            //NextViewContorollerで保存した最高得点の値を持ってくる
        if UserDefaults.standard.object(forKey: "newRecord") != nil{
            maxScore = UserDefaults.standard.object(forKey: "newRecord") as! Int
        }
        
        maxScoreLabel.text = String(maxScore)
    }
    
    @IBAction func answer(_ sender: Any) {
//        丸ボタン(タグNo.1)が押された場合の処理
        if (sender as AnyObject).tag == 1{
            pickedAnswer = true
        }
//        バツボタン(タグNo.2)が押された場合の処理
        else if (sender as AnyObject).tag == 2{
            pickedAnswer = false
        }
        //回答が正解かどうかを判断(pickedAnswerとImagesListのCorrectOrNotを用いて判断)
        check()
        nextQuestions()
    }
    
    func check(){
        let correctAnswer = imagesList.list[0].answer
        if correctAnswer == pickedAnswer{
            print("正解")
            correctCount = correctCount + 1
        }
        else{
            print("不正解")
            wrongCount = wrongCount + 1
        }
    }
    
    func nextQuestions(){
        if questionNumber <= 9{
            questionNumber = questionNumber + 1
            imageView.image = UIImage(named: imagesList.list[questionNumber].imageTexit)
        }
        else{
            print("問題は終了です")
            //画面遷移する呪文
            performSegue(withIdentifier:"next", sender: nil)
        }
        
    }
//NextViewControllerに値を渡すための呪文
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let nextVC = segue.destination as! NextViewController
            
            nextVC.correctedCount = correctCount
            nextVC.wrongedCount = wrongCount
            nextVC.delegate = self
        }
    }
    
}

