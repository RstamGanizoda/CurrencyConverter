import UIKit

private extension UIColor {
    static let textColor: UIColor = UIColor(
        red: 22.0/255.0,
        green: 63.0/255.0,
        blue: 131.0/255.0,
        alpha: 1.0)
}
private extension CGFloat {
    static let cornerRadius: CGFloat = 20
    static let paddingTextField: CGFloat = 10
}

private extension String {
    static let placeholderComment = "0000.00"
}

class mainViewController: UIViewController {
    
    @IBOutlet weak var syncButton: UIButton!
    @IBOutlet weak var converterView: UIView!
    @IBOutlet weak var firstCurrencyFlagImageView: UIImageView!
    @IBOutlet weak var secondCurrencyFlagImageView: UIImageView!
    @IBOutlet weak var firstCurrencyLabel: UILabel!
    @IBOutlet weak var secondCurrencyLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var convertedAmountLabel: UILabel!
    @IBOutlet weak var exchangeRateLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var convertedAmountTextField: UITextField!
    @IBOutlet weak var mainSubtitle: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var exchangeRateTitleLable: UILabel!
    @IBOutlet weak var secondDropDownButton: UIButton!
    @IBOutlet weak var firstDropDownButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modifyConverterView()
        modifyCurrencyFlag()
        modifyAmountTextFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.setGradientBackground()
    }
    
    
    @IBAction func syncButtonPressed(_ sender: UIButton) {
        syncButton.zoomInOut()
    }
    
    @IBAction func firstDropDownButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func secondDropDownButtonPressed(_ sender: UIButton) {
    }
    
    
    private func modifyConverterView() {
        converterView.layer.cornerRadius = .cornerRadius
        converterView.backgroundColor = .white
        converterView.dropShadow()
    }
    
    private func modifyCurrencyFlag() {
        firstCurrencyFlagImageView.layer.cornerRadius = firstCurrencyFlagImageView.frame.width / 2
        secondCurrencyFlagImageView.layer.cornerRadius = secondCurrencyFlagImageView.frame.width / 2
    }
    
    private func modifyAmountTextFields() {
        amountTextField.textFieldParameters()
        
        let placeholderComment = NSAttributedString(
            string: .placeholderComment,
            attributes: [NSAttributedString
                .Key
                .foregroundColor: UIColor.textColor]
        )
        amountTextField.attributedPlaceholder = placeholderComment
        amountTextField.textFieldsSettings()
        amountTextField.textFieldParameters()
        convertedAmountTextField.textFieldsSettings()
        convertedAmountTextField.textFieldParameters()
    }
}

extension mainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        amountTextField.resignFirstResponder()
        convertedAmountLabel.resignFirstResponder()
        return true
    }
}

extension UITextField {
    func textFieldsSettings() {
        self.textColor = .textColor
        self.rightViewMode = .always
        self.clearButtonMode = .always
        self.clearsOnBeginEditing = true
        self.autocapitalizationType = .words
        self.borderStyle = .none
        self.font = UIFont(name: "Helvetica", size: 22)
    }
}
