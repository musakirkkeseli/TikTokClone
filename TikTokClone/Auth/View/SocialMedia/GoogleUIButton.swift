import UIKit

class CustomButton: UIButton {
    
    var loginButtonType: LoginButtonType? {
            didSet {
                configureForButtonType()
            }
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        // Customize the button's appearance
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 8.0
        titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
    }
    
    private func configureForButtonType() {
            guard let loginButtonType = loginButtonType else { return }
            
            switch loginButtonType {
            case .google:
                setTitle("Google", for: .normal)
                if let googleIconImage = UIImage(named: "googleIcon") {
                    let resizedIcon = resizeImage(image: googleIconImage, targetSize: CGSize(width: 20, height: 20))
                    setImage(resizedIcon, for: .normal)
                }
            case .facebook:
                setTitle("Facebook", for: .normal)
                if let facebookIconImage = UIImage(named: loginButtonType.rawValue.description) {
                    let resizedIcon = resizeImage(image: facebookIconImage, targetSize: CGSize(width: 20, height: 20))
                    setImage(resizedIcon, for: .normal)
                }
            case .apple:
                setTitle("Apple", for: .normal)
                if let appleIconImage = UIImage(named: loginButtonType.rawValue.description) {
                    let resizedIcon = resizeImage(image: appleIconImage, targetSize: CGSize(width: 20, height: 20))
                    setImage(resizedIcon, for: .normal)
                }
            }
        }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}

//#Preview{
//    let customButton = CustomButton()
//    customButton.loginButtonType = LoginButtonType.google
//    return customButton
//}
