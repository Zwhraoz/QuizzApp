//
//  detailViewController.swift
//  QuizApp
//
//  Created by zehra özer on 21.01.2024.
//

import UIKit

class detailViewController: UIViewController {
    
    var timer: Timer?
       var secondsRemaining = 30

    let questions=[" Simyaci kitabının yazarı kimdir?",
                   "Gezegenler isimlerini nereden alır?",
                   "Güneş sisteminde kaç gezegen vardır?",
                   "Türkiye’de Erozyonla mücadele amacıyla kurulan vakfın kısa adı nedir?",
                   "Gece gündüz eşitliği (ekinoks) bir yılda kaç kez gerçekleşir?",
                   "Nobel ödülleri hangi ülkede verilmektedir?",
                   "Türkiye’nin uluslararası otomatik telefon kod numarası kaçtır?",
                   " Amerika kıtasını 2’ye ayıran önemli su geçidinin adı nedir?",
                   "UEFA Kupasını alan ilk Türk takımı hangisidir?",
                   "Cumhurbaşkanı kaç yılda bir seçilir?",
                   "Türk Devleti bir Cumhuriyettir.’ ifadesi anayasamızın kaçıncı maddesidir?",
                   "Pusulada ( N ) harfi hangi yönü ifade eder ",
                   "Maddenin ölçülemeyen özelliği hangisidir ?",
                   "’’Sanat Güneşi’’ olarak adlandırdığımız ünlü sanatçımız kimdir?",
                   "Dünyada insanları cimri olarak adlandırılan ülke hangisidir?",
                   "Ülkemizin yüzölçümü en büyük ikinci gölü hangisidir?",
                   "Basketbol takımında oyuncuların forma numarası hangi sayıyla başlar?",
                   "2011 Dünya Üniversitelerarası Kış Olimpiyatları hangi ilimizde yapıldı?",
                   "Tarihi Aspendos Tiyatrosu hangi ilimizdedir?",
                   "Avrupa Birliği üyesi olmasına rağmen ortak birimi olan Euro’yu kabul etmeyen ve kendi para birimini kullanan ülke hangisidir?",
                   "Yaprak Dökümü adlı romanın yazarı kimdir?",
    ];
    
    
    let answers=[["Paule Coelho","Osho","Lev Tolstoy","Dostyoveski"],
                 ["Yunan tanrılarından","Onları keşfeden bilim adamlarından","Latince Kelimelerden","İtalyanca kelimelerden"],
                 ["8","9","10","11"],
                 ["Tema","Akut","ErozyonVakfı","Tubitak"],
                 ["2","3","4","1"],
                 ["İsviçre","Norveç","Amerika","İngiltere"],
                 ["90","212","0212","05"],
                 ["Panama","CebeliTarık","Süveş","Çanakkale Boğazi"],
                 ["Galatasaray","Fenerbahçe","Beşiktaş","Trabzonspor"],
                 ["5","4","2","6"],
                 ["1","2","3","4"],
                 ["Kuzey","Güney","Doğu","Batı"],
                 ["Koku","Kütle","Ağırlığı","Hacmi"],
                 ["Zeki Müren","Bülent Ersoy","Müslüm Gürses","Ajda Pekkan"],
                 ["İskoçya","Almanya","Fransa","Norveç"],
                 ["Tuz Gölü","Van Gölü","Lut Gölü","Erzincan Gölü"],
                 ["4","1","2","3"],
                 ["Erzurum","Van","Hakkari","Bolu"],
                 ["Antalya","Muğla","Bodrum","Mersin"],
                 ["İngiltere","Almanya","Fransa","İtalya"],
                 ["Reşat Nuri Güntekin","Halide Edip Adıvar","Kemal Beyatlı","Mehmet Rauf"]
                 
                 
                 
                 
                 
    ];
    
    
    @IBOutlet weak var soruLabel: UILabel!
       @IBOutlet weak var surelbl: UILabel!
       @IBOutlet weak var btnA: UIButton!
       @IBOutlet weak var btnB: UIButton!
       @IBOutlet weak var btnC: UIButton!
       @IBOutlet weak var btnD: UIButton!

    @IBOutlet weak var scoreLbl: UILabel!
    var currentQuestion = 0
       var score = 0
       var rightAnswer: UInt32 = 0
       var defaults = UserDefaults.standard
       
       override func viewDidLoad() {
           super.viewDidLoad()
           btnA.layer.cornerRadius = 10
           btnB.layer.cornerRadius = 10
           btnC.layer.cornerRadius = 10
           btnD.layer.cornerRadius = 10
       }
       
       override func viewWillAppear(_ animated: Bool) {
           startTimer()
           nextQuestion()
       }
       
       @IBAction func btn(_ sender: UIButton) {
           if sender.tag == Int(rightAnswer) {
               print("right!!")
               score += 1
               scoreLbl.text = "Score: \(score)"

           } else {
               print("wrong!!")
           }
           
           if currentQuestion != questions.count {
               // Süreyi sıfırla ve timer'ı başlat
               resetTimer()
               nextQuestion()
           } else {
               defaults.set(String(score), forKey: "score")
               defaults.synchronize()
               self.dismiss(animated: true, completion: nil)
           }
       }
       
       func nextQuestion() {
           soruLabel.text = questions[currentQuestion]
           rightAnswer = arc4random_uniform(4) + 1
           var button: UIButton
           var x = 1
           for i in 1...4 {
               if let buttonWithTag = view.viewWithTag(i) as? UIButton {
                   button = buttonWithTag
                   if i == Int(rightAnswer) {
                       button.setTitle(answers[currentQuestion][0], for: .normal)
                   } else {
                       button.setTitle(answers[currentQuestion][x], for: .normal)
                       x = 2
                   }
               }
           }
           currentQuestion += 1
       }
       
       func startTimer() {
           timer?.invalidate()
           secondsRemaining = 30
           timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
       }

       func resetTimer() {
           timer?.invalidate()
           startTimer()
       }

       @objc func updateTimer() {
           secondsRemaining -= 1
           surelbl.text = "\(secondsRemaining) saniye kaldı"
           
           if secondsRemaining == 0 {
               resetTimer()
               // Zaman dolduğunda bir şeyler yapabilirsiniz, örneğin yanlış cevap olarak işareleyebilirsiniz.
           }
       }
   }
