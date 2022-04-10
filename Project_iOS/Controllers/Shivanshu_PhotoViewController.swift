//
//  Shivanshu_PhotoViewController.swift
//  Project_iOS
//
//  Created by SHivanshu on 2022-04-07.
//

import UIKit

class Shivanshu_PhotoViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var buttonClick: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func didTapButton()
    {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present (picker,animated: true)
        
        
    }
    func convertImageToBase64(image: UIImage) -> String {
           let imageData = image.pngData()!
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
     }

      func convertBase64ToImage(imageString: String) -> UIImage {
          let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
          return UIImage(data: imageData)!
       }



}
extension Shivanshu_PhotoViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        else{
            return
        }
        imageView.image = image
    
        
    }
}
    
