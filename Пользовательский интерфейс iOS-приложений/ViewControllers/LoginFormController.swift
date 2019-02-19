
import UIKit

class LoginFormController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Outlets
    
    @IBOutlet private weak var scrollView: UIScrollView!   // вывели прокрутку экрана
    
    @IBOutlet private weak var titleLable: UILabel! // связь с названием приложения
    
    @IBOutlet private weak var loginHintLable: UILabel! // связь с названием поля "Логин"
    @IBOutlet private weak var loginField: UITextField!    // получаем данные из поля "Логин"
    
    @IBOutlet private weak var passwordHintLable: UILabel! // связь с названием поля "Пароль"
    @IBOutlet private weak var passwordField: UITextField! // получаем данные из поля "Пароль"
    
    @IBOutlet private weak var loginButton: UIButton! // связь с кнопкой "Ок"
    
    
    private let demoLogin = "123"
    private let demoPassword = "456"
    
    //MARK: - Actions
    
    @IBAction func logInButtonAction() {
        print("LogInButtonAction")
        
        guard let loginText = self.loginField?.text else {
            print("Empty Login Text")
            return
        }
        guard let passwordText = self.passwordField?.text else {
            print("Empty Password Text")
            return
        }
        if self.demoLogin == loginText && self.demoPassword == passwordText {
            print("Success")
            self.performSegue(withIdentifier: "openApp", sender: nil)
        } else {
            print("loginText or passwordText are invalid")
            self.showErrorAlert()
        }
    }
    
    @IBAction func logOutButtonAction(segue: UIStoryboardSegue?) { // кнопка выхода из приложения
        
        let destinationVC = segue?.destination // Login
        let source = segue?.source // MyFriends
    }
    
    @IBAction func closeKeyboardAction() {   // убираем клавиатуру по тапу
        print("closeKeyboardAction")
        self.view.endEditing(true)
    }

    //MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.addNotification()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addNotification()
    }
    deinit {
        self.removeNotification()
    }
    
    //MARK: - Notifications
    
    private func addNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWasShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func removeNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - UITextField    ----- Не работает -----
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let loginField = self.loginField, loginField == textField {
            print("TextFieldShouldReturn Login")
            
            self.passwordField?.becomeFirstResponder()
            
        } else if let passwordField = self.passwordField, passwordField == textField {
            print("TextFieldShouldReturn Password")
    
            self.passwordField?.resignFirstResponder()
        } else {
            print("TextFieldShouldReturn Unkown")
        }
        return true
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return true
        }
        guard let textRange = Range(range, in: text) else {
            return true
        }
        let updatedText = text.replacingCharacters(in: textRange, with: string)
        if let passwordField = self.passwordField, passwordField == textField, updatedText.count > 3 {
            return false
        }
        return true
    }
    
    //MARK: - KeyboardWasShow/WillHide
    
    @objc func keyboardWasShow(notification: Notification) {
        guard let userInfo = notification.userInfo as NSDictionary? else {
            return
        }
        guard let keyboardFrame = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {
            return
        }
        
        let keyboardHeight = keyboardFrame.cgRectValue.size.height
        let contentInsets = UIEdgeInsets(top:0 ,
                                         left: 0,
                                         bottom: keyboardHeight,
                                         right: 0)
        
        self.scrollView?.contentInset = contentInsets
        self.scrollView?.scrollIndicatorInsets = contentInsets
    }

    @objc private func keyboardWillHide(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }
    
    //MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.titleLable.text = "ВКонтакте" // тут можно поменять какую-то информацию перед тем как она будет отображена пользователю
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    // тут отписываемся от уведомлений (начиная с 12.0 Не ненужно это делать)
    func viewWillDissapear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Alerts
    
    //Создаем функцию вывода алерта в случае ошибки
    func showErrorAlert() {
        
        let alertController = UIAlertController(  // Создаем контроллер
            title: "Error",
            message: "Login or Password are invalid",
            preferredStyle: .alert)
     
//        let alertOkAction = UIAlertAction(        // Создаем кнопку "OK" для UIAlertController
//            title: "Ok",
//            style: .cancel) {(alert: UIAlertAction)
//        in print("alertOkAction")}
//        
//        alertController.addAction(alertOkAction)  // Добавляем кнопку для UIAlertController
        
        let alertCancelAction = UIAlertAction(    // Создаем кнопку "Cancel" для UIAlertController
            title: "Cancel",
            style: .cancel) {(alert: UIAlertAction)
        in print("alertCancelAction")}
        
        alertController.addAction(alertCancelAction) // Добавляем кнопку для UIAlertController

        self.present(                                     // Показываем UIAlertController
            alertController,
            animated: true,
            completion: nil)
    }
}
