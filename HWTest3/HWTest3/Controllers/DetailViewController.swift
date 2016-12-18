//
//  DetailViewController.swift
//  HWTest3
//
//  Created by otey on 12/18/16.
//  Copyright © 2016 tey. All rights reserved.
//

import UIKit

protocol DetailViewControllerInterface{
    func sendImageSuccess(imageString: String)
    func postSuccess(message:String)
}

class DetailViewController: UIViewController {
    var articles = [ArticalModel]()
    var imagePicker:UIImagePickerController?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextAre: UITextView!
    
    @IBOutlet weak var imageDetailView: UIImageView!

    var detailPresenter: DetailViewPresenter?
    
    @IBAction func buttonSaveClick(_ sender: Any) {
        
        detailPresenter?.uploadData(imageURL: imageDetailView.image!)
        
        
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let singleTouch = UITapGestureRecognizer(target: self, action: Selector("tapDetected"))
        singleTouch.numberOfTapsRequired = 1
        self.imageDetailView.isUserInteractionEnabled = true
        self.imageDetailView.addGestureRecognizer(singleTouch)
        imagePicker = UIImagePickerController()
        imagePicker?.delegate = self
        
        detailPresenter = DetailViewPresenter()
        detailPresenter?.detailViewDdelegate = self
        detailPresenter?.dataLoad(viewController: self)

        // Do any additional setup after loading the view.
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
extension DetailViewController:DetailViewControllerInterface{
    func sendImageSuccess(imageString: String) {
        detailPresenter?.postData(title: titleTextField.text!, description: descriptionTextAre.text, image: imageString)
    }
    func postSuccess(message:String){
        print(message)
        _ = navigationController?.popViewController(animated: true)
        //self.navigationController?.popToRootViewController(animated: true)
    }
}


extension DetailViewController:UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imageDetailView.image = image
            self.dismiss(animated: true, completion: nil)
            
            
        }else{
            
        }
        
    }
    func tapDetected() {
        imagePicker?.allowsEditing = false
        imagePicker?.sourceType = .photoLibrary
        present(imagePicker!, animated: true, completion: nil)
    }
    
}
