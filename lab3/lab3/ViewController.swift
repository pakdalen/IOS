//
//  ViewController.swift
//  lab3
//
//  Created by dalen on 3/5/20.
//  Copyright © 2020 dalen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:"+",style:.plain,target:self,action:#selector(AddFigure))
        
        // Do any additional setup after loading the view.
    }

    @objc func AddFigure(){
        let storyboard=UIStoryboard(name: "Main",bundle:nil)
        let vc=storyboard.instantiateViewController(identifier:"id") as FigureViewController
        vc.figure={[weak self] view in guard let self=self else{return}
            self.view.addSubview(view)
            let t = UITapGestureRecognizer(target: self, action: #selector(self.tGesture))
            view.addGestureRecognizer(t)
            let p = UIPanGestureRecognizer(target: self, action: #selector(self.pGesture(recognizer:)))
            view.addGestureRecognizer(p)
            let pin = UIPinchGestureRecognizer(target: self, action: #selector(self.pinGesture))
            view.addGestureRecognizer(pin)
        }
    
    navigationController?.pushViewController(vc,animated:true)
    }
    @objc func tGesture(_ sender: UITapGestureRecognizer){
        guard let view = sender.view else{return}
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(identifier: "id") as FigureViewController
    vc.selected = view
    navigationController?.pushViewController(vc, animated: true)
    }
    var pos: CGPoint!
    @objc func pGesture(recognizer: UIPanGestureRecognizer){
        guard let view = recognizer.view else {return}
        
        if recognizer.state == .began{
            pos = view.frame.origin
        }
        else if recognizer.state == .changed{
            view.frame.origin = CGPoint(x: pos.x + recognizer.translation(in: view).x, y: pos.y + recognizer.translation(in: view).y)
        }
    }
    @objc func pinGesture(_ sender: UIPinchGestureRecognizer){
        guard let view = sender.view else { return }

        if sender.state == .began || sender.state == .changed {
            view.transform = (view.transform.scaledBy(x: sender.scale, y: sender.scale))
           sender.scale = 1.0
        }
    }
}

