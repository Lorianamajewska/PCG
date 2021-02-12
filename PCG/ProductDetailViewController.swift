//
//  CustomizeViewController.swift
//  PCG
//
//  Created by Bobby Keffury on 8/28/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    // MARK: - Properties
    
    var product: Product?
    var addBadgeDelegate: AddBadgeToButtonDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionTextView: UITextView!
    @IBOutlet weak var customizeButton: UIButton!
    @IBOutlet weak var bottomFadeView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceWithSubLabel: UILabel!
    
    
    // MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        setupSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        addBadgeDelegate?.addBadgeToButton()
    }
    
    // MARK: - Methods
    
    private func setupSubviews() {
        customizeButton.layer.cornerRadius = 15
        customizeButton.addShadow()
        
        bottomFadeView.addBottomUpGradient(color: UIColor.init(named: "Tan")!.cgColor)
        
        
        guard let product = product else { return }
        
        
        priceLabel.text = "$\(String(format: "%.0f", product.price))"
        
        priceWithSubLabel.text = "$\(String(format: "%.0f", product.twentyUnitPrice))"
    }
    
    private func updateViews() {
        guard let product = product else { return }
        
        productImageView.image = product.image
        productImageView.layer.cornerRadius = 20.0
        productImageView.clipsToBounds = true
        productTitleLabel.text = product.title
        productDescriptionTextView.text = product.description
    }
    
    // MARK: - Actions
    
    @IBAction func customizeButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "customizeSegue", sender: self)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "customizeSegue" {
            if let customizeVC = segue.destination as? CustomizeViewController, let product = product {
                customizeVC.product = product
            }
        }
    }

}
