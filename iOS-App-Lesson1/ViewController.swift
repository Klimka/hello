//
//  ViewController.swift
//  iOS-App-Lesson1
//
//  Created by Клим Зелинский on 15.10.17.
//  Copyright © 2017 Клим Зелинский. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
   
    override func shouldPerformSegue(withIdentifier: String, sender: Any?) -> Bool {
        let login = loginInput.text!
        let password = passwordInput.text!
        
                
        if login == "klim" && password == "123" {
            print("login succesful")
            return true
        } else {
            print("you shall not pass")
            
            //создаем сообщение об ошибке
            let alert = UIAlertController(title: "You Shall Not Pass", message: "wrong username or password", preferredStyle: .alert)
            //создаем кнопку для UIAlertController
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            //добавляем кнопку на UIAlertController
            alert.addAction(action)
            //показываем его
            present(alert, animated: true, completion: nil)
            
            return false
            
        }
    }
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        
        //присваиваем его UIScrollView
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    
    
    @IBAction func actionSign(_ sender: Any) {
    

}
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
 
    

    @IBAction func unwindSegue(unwindSegue: UIStoryboardSegue) {
    }
    


} // end of class

extension ViewController {
        // когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        //получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
        
        // добавляем отступ внизу UIScrollView равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    // когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // устанавливаем отступ внизу UIScrollView равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    


    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //подписываемся на уведомления
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        //второе когда пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    //скрывание клавиатуры по нажатию на пустой экран
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
 

    
    
    
}




