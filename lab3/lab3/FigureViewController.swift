//
//  FigureViewController.swift
//  lab3
//
//  Created by dalen on 3/7/20.
//  Copyright © 2020 dalen. All rights reserved.
//

import UIKit

class FigureViewController: UIViewController {

    @IBAction func w(_ sender: UIButton) {
        switch UIColor.white {
        case Red.backgroundColor:
            Red.tintColor = UIColor.white
            Red.backgroundColor = UIColor.red
        case Blue.backgroundColor:
            Blue.tintColor = UIColor.white
            Blue.backgroundColor = UIColor.blue
        case Green.backgroundColor:
            Green.tintColor = UIColor.white
            Green.backgroundColor = UIColor.green
        default:
            Black.tintColor = UIColor.white
            Black.backgroundColor = UIColor.black
        }
        color = sender.backgroundColor
        sender.tintColor = sender.backgroundColor
        sender.backgroundColor = UIColor.white
    }
    @IBAction func q(_ sender: UIButton) {
        switch UIColor.white {
              case Red.backgroundColor:
                  Red.tintColor = UIColor.white
                  Red.backgroundColor = UIColor.red
              case Blue.backgroundColor:
                  Blue.tintColor = UIColor.white
                  Blue.backgroundColor = UIColor.blue
              case Green.backgroundColor:
                  Green.tintColor = UIColor.white
                  Green.backgroundColor = UIColor.green
              default:
                  Black.tintColor = UIColor.white
                  Black.backgroundColor = UIColor.black
              }
              color = sender.backgroundColor
              sender.tintColor = sender.backgroundColor
              sender.backgroundColor = UIColor.white
    }
    @IBAction func x(_ sender: UIButton) {
        switch UIColor.white {
              case Red.backgroundColor:
                  Red.tintColor = UIColor.white
                  Red.backgroundColor = UIColor.red
              case Blue.backgroundColor:
                  Blue.tintColor = UIColor.white
                  Blue.backgroundColor = UIColor.blue
              case Green.backgroundColor:
                  Green.tintColor = UIColor.white
                  Green.backgroundColor = UIColor.green
              default:
                  Black.tintColor = UIColor.white
                  Black.backgroundColor = UIColor.black
              }
              color = sender.backgroundColor
              sender.tintColor = sender.backgroundColor
              sender.backgroundColor = UIColor.white
    }
    @IBAction func z(_ sender: UIButton) {
        switch UIColor.white {
              case Red.backgroundColor:
                  Red.tintColor = UIColor.white
                  Red.backgroundColor = UIColor.red
              case Blue.backgroundColor:
                  Blue.tintColor = UIColor.white
                  Blue.backgroundColor = UIColor.blue
              case Green.backgroundColor:
                  Green.tintColor = UIColor.white
                  Green.backgroundColor = UIColor.green
              default:
                  Black.tintColor = UIColor.white
                  Black.backgroundColor = UIColor.black
              }
              color = sender.backgroundColor
              sender.tintColor = sender.backgroundColor
              sender.backgroundColor = UIColor.white
    }
    @IBOutlet weak var Black: UIButton!
    @IBOutlet weak var Blue: UIButton!
    @IBOutlet weak var Green: UIButton!
    @IBOutlet weak var Red: UIButton!
    @IBOutlet weak var d: UITextField!
    @IBOutlet weak var c: UITextField!
    @IBOutlet weak var b: UITextField!
    @IBOutlet weak var a: UITextField!
    
    var color: UIColor?
    var selected: UIView?
    var figure:((_ v:UIView)->Void)?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let save = UIBarButtonItem(title:"Save",style:.plain,target:self,action:#selector(Save))
        let delete=UIBarButtonItem(title:"Delete",style:.plain,target:self,action:#selector(Delete))
        
        
        navigationItem.rightBarButtonItems = [ save, delete ]

        

        // Do any additional setup after loading the view.
    }
    @objc func Save(){
        guard let o = a.text, let p = b.text, let k = c.text, let l = d.text, let color = color else {
            let alert = UIAlertController(title: "Ошибка", message: "Заполните данные", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        guard let width = Double(o), let height = Double(p), let x = Double(k), let y = Double(l) else {
            let alert = UIAlertController(title: "Ошибка", message: "НЕ Существует", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        guard let figure = selected else {
            let figure = UIView(frame: CGRect(x:x, y:y, width: width, height: height))
            figure.backgroundColor = color
            self.figure?(figure)
            self.navigationController?.popViewController(animated: true)
            return
            
        }
        figure.frame = CGRect(x: CGFloat(x), y: CGFloat(y), width: CGFloat(width), height: CGFloat(height))
                figure.backgroundColor = color

        self.navigationController?.popViewController(animated: true)
        
        
    }
    @objc func Delete(){
        guard let figure = selected else {
            self.navigationController?.popViewController(animated: true)

            return
            
        }
        figure.removeFromSuperview()
        self.navigationController?.popViewController(animated: true)
        
        
        
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
