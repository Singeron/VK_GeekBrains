//

import UIKit

class LoginFormController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!   // вывели прокрутку экрана
    @IBOutlet weak var loginField: UITextField!    // получаем данные из поля "Логин"
    @IBOutlet weak var passwordField: UITextField! // получаем данные из поля "Пароль"
    
    @IBAction func logOutAction(segue: UIStoryboardSegue?) { // кнопка выхода из приложения
        
        let destinationVC = segue?.destination // Login
        let source = segue?.source // MyFriends
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // на скролл вью добавили рекогнайзер, который будет отрабатывать на Тап
        let hideRecoghizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // тут мы вешаем рекогнайзер на Тап вью
        scrollView.addGestureRecognizer(hideRecoghizer)
        // подписываемся на уведомления когда клавиатура должна появиться
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyBoardWasShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
            )
        // подписываемся на уведомления когда клавиатура должна появиться
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyBoardWasShow),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    // тут отписываемся от уведомлений (начиная с 12.0 Не ненужно это делать)
    func viewWillDissapear(_ animated: Bool){
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // забираем размеры клавиатуры
    @objc func keyBoardWasShow (notification: Notification) {
        guard
            let info = notification.userInfo as NSDictionary?,
            let kbSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
            else { return }
        
        let insets = UIEdgeInsets(top:0 , left: 0, bottom: kbSize.height, right: 0)
        
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
    }
    // этот метод прячет клавиатуру при Тапе
    @objc func keyboardWasHiden(){
        scrollView.endEditing(true)
    }
    // этот метод обнуляет инсеты
    @objc func hideKeyboard(){
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    // Функция перехода на следующий экран в случае успешной авторизации
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // Проверяем данные
        let checkResult = checkUserData()
        // Если данные не верны, покажем ошибку
        if !checkResult {
            showLoginError()
            }
        // Вернем результат
        return checkResult
    }
    
    // Метод для проверки логина и пароля и возвращает булево значение (да/нет)
    func checkUserData() -> Bool {
        
        let login = loginField.text
        let password = passwordField.text
        
        if login == " " && password == " " {
            return true
            } else {
            return false
        }
    }
    
    //Создаем функцию вывода алерта в случае ошибки
    func showLoginError() {
        // Создаем контроллер
        let alert = UIAlertController(
            title: "Ошибка",
            message: "Введены не верные данные пользователя",
            preferredStyle: .alert
            )
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(
            title: "Ok",
            style: .cancel,
            handler: nil
            )
        // Добавляем кнопку для UIAlertController
        alert.addAction(action)
        // Показываем UIAlertController
        present(
            alert,
            animated: true,
            completion: nil
            )
        }
}
