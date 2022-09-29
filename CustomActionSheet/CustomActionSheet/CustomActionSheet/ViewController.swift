//
//  ViewController.swift
//  CustomActionSheet
//
//  Created by Junho Lee on 2022/02/17.
//

import UIKit

class ViewController: UIViewController {
    
    let customAction = SparkActionSheet()
    private let picker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
    }
    
    @IBAction func presentActionSheet(_ sender: Any) {
        customAction.addAction(SparkAction("1번 버튼", titleType: .normalTitle, handler: {
            print("1번")
        }))
        
        customAction.addAction(SparkAction("2번 버튼", titleType: .pinkTitle, handler: {
            print("2번")
        }))
        
        customAction.addSection()
        
        customAction.addAction(SparkAction("앨범 보기", titleType: .normalTitle, handler: {
            self.customAction.dismiss(animated: true) {
                self.picker.sourceType = .photoLibrary
                self.present(self.picker, animated: true, completion: nil)
            }
        }))
        
        present(customAction, animated: true)
    }
    
    private func setUI() {
        view.backgroundColor = .systemPurple
    }
}

// MARK: - UIImagePickerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        }
        
    }
}
