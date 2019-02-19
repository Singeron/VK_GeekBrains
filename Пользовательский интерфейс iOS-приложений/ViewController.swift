//
//
//import UIKit
//
//class ViewController: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//}
//// Расширение класса для TableView контроллера (при этом мы всегда должны говорить TableView, для нашей ячейка является DataSource)
//extension ViewController: UITableViewDataSource {
//    // задаем количество секций
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    // задаем количество строк
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    // переопределяем ячейки
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SomeCell", for: indexPath) as! TableViewCell
//        cell.label.text = "Hello table"
//        return cell
//    }
//}
//// Расширение класса для TableView контроллера (при этом мы всегда должны говорить TableView, для нашей ячейка является Delegate)
//extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt IndexPath: IndexPath) {
//        print("Нажата строка \(IndexPath.row) в секции \(IndexPath.section)")
//    }
//}
//// Расширение класса для CollectionView контроллера (при этом мы всегда должны говорить TableView, для нашей ячейка является DataSource)
////extension ViewController: UICollectionViewDataSource {
////    // задаем количество секций
////    func numberOfSections(in collectionView: UICollectionView) -> Int {
////        return 1
////    }
////    // задаем количество строк
////    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return 10
////    }
////    // переопределяем ячейки
////    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UITableViewCell {
////        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "SomeItem", for: indexPath) as! CollectionViewCell
////        return item
////    }
////}
////// Расширение класса для CollectionView контроллера (при этом мы всегда должны говорить TableView, для нашей ячейка является Delegate)
////extension ViewController: UICollectionViewDelegate {
////    func tableView(_ tableView: UICollectionView, didSelectRowAt IndexPath: IndexPath) {
////        print("Нажата строка \(IndexPath.row) в секции \(IndexPath.section)")
////    }
////}
