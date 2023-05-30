import UIKit

private extension Double {
    static let durationForButtonClick: Double = 0.2
    static let scalesForButtonClick: Double = 0.9
    static let widthShadowOffset: Double = 5.0
    static let heightShadowOffset: Double = 8.0
    static let shadowOpacity: Double = 0.5
}

private extension CGFloat {
    static let shadowRadius: CGFloat = 20
    static let textFieldCornerRadius: CGFloat = 10
    static let alphaForTextField: CGFloat = 0.2
}

private extension UIColor {
    static let topColor: UIColor = UIColor(
        red: 216.0/255.0,
        green: 197.0/255.0,
        blue: 200.0/255.0,
        alpha: 1.0
    )
    static let bottomColor: UIColor = UIColor(
        red: 247.0/255.0,
        green: 247.0/255.0,
        blue: 247.0/255.0,
        alpha: 1.0
    )
}

extension UIView {
    func textFieldParameters(
          cornerRadius: CGFloat = .textFieldCornerRadius,
          backgroundColor: UIColor = .systemGray3.withAlphaComponent(.alphaForTextField)
      ){
          self.layer.cornerRadius = cornerRadius
          self.backgroundColor = backgroundColor
          self.layer.masksToBounds = true
      }
    
    func zoomInOut(duration: TimeInterval = .durationForButtonClick) {
        UIView.animate(
            withDuration: duration,
            delay: .zero,
            options: .curveLinear,
            animations: {
            self.transform = CGAffineTransform(scaleX: CGFloat(.scalesForButtonClick),
                                               y: CGFloat(.scalesForButtonClick))
            },
            completion: { _ in
                UIView.animate(
                    withDuration: duration,
                    delay: .zero,
                    options: .curveLinear
                ){
                    self.transform = CGAffineTransform.identity
                }
            })
    }
    
    func setGradientBackground() {
        let colorTop = UIColor.topColor.cgColor
        let colorBottom = UIColor.bottomColor.cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func dropShadow() {
            self.layer.masksToBounds = false
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOpacity = Float(.shadowOpacity)
            self.layer.shadowOffset = CGSize(
                width: .widthShadowOffset,
                height: .heightShadowOffset
            )
            self.layer.shadowRadius = .shadowRadius
            self.layer.shadowPath = UIBezierPath(
                roundedRect: self.bounds,
                cornerRadius: self.layer.cornerRadius
            ).cgPath
        }
}
