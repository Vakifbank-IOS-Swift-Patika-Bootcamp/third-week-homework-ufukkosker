//
//  MainViewController.swift
//  RandomQuotesApp
//
//  Created by Ufuk on 20.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var viewModel: MainViewControllerViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func getQuotesRandomButtonTapped(_ sender: Any) {
        viewModel?.didTappedFetchQuotesRandomButton()
    }
}

extension MainViewController: MainViewControllerDelegate {
    func handle(output: MainViewControllerOutput) {
        switch output {
        case .fetchedQuotesRandom:
            DispatchQueue.main.async {
                self.textView.text = self.viewModel?.quotesRandom.en ?? ""
            }
        }
    }
}
