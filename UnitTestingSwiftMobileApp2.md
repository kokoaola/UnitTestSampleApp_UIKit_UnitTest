# iOS開発におけるUnitTestについての基本知識



## Xcodeプロジェクトへの導入方法
### プロジェクト作成時に追加する方法
- Appプロジェクト作成時、下の方にある「Include Tests」のチェックボックスにチェックを入れる
- ソースツリー一番上のプロジェクト名をクリックすると、ターゲットにxxxxTestsとxxxxUITestsが自動で追加される。ソースツリーにもxxxxTestsとxxxxUITestsフォルダが追加される
- フォルダの中にはSwiftファイルがあって、デフォルトのテンプレートのテストケースが作成されている
### あとから追加する方法
- あとからUnitTestを導入したい場合は、ソースツリー一番上のプロジェクト名をクリック、Targetの下の＋ボタンからUnitTestを検索して導入する



## テストで使用するメソッドについて
- テストを導入すると、xxxxTestsフォルダが自動で追加され、フォルダの中にはxxxxTests.swiftというファイルが生成される。このファイルにはテンプレート用のテストケースクラスが自動で記述してある

### setUpメソッド
- 各単体テストのインスタンスの作成など、テストケースに共通する初期設定や前処理を行うために使用されるメソッド
- テストメソッドの前に呼び出される
  #### class func setUp():
  - クラスメソッドのため、各クラスのライフサイクルにおいて、最初に1回だけ実行される
  - 各ユニットテストで共通して使用するインスタンスを作成したりする
  #### func setUp():
  - インスタンスレベルのメソッドのため、テストケースクラス内の各テストメソッドが呼び出される前に、毎回1回呼び出される
  #### func setUpWithError():
  - テンプレートに自動で追加されるメソッド
  - エラーを投げることができる。それ以外はfunc setUp()と同じ

### tearDownメソッド
- テストメソッドの処理が終了したあとに呼び出される、クリーンアップ用のメソッド
- メモリの負荷の解消するため、setUpWithErrorで行った初期設定やテストメソッドが作成したリソースを解放する処理を記述することが多い
  #### class func tearDown():
  - クラスメソッドのため、各クラスのライフサイクルの最後に1回だけ実行される
  #### func tearDown():
  - インスタンスソッドのため、テストケースクラス内の各テストメソッドが終わるごとに毎回呼び出される
  #### tearDownWithError():
  - テンプレートに自動で追加されるメソッド
  - エラーを投げることができる。それ以外はfunc tearDown()と同じ

### testメソッド
  - コードの隣にひし形◇マークがあるメソッド
  - 実際に行う内容を記述するテストメソッド（テストが成功するとひし形が緑になって、失敗すると赤くなる）d\
  - XCTAssertを使用して、テストが期待通りの結果を返すかを確認できる
  #### testExample():
  - テンプレートに自動で追加されるメソッド
  - テストしたい内容を記述する
  - メソッド名をtestから始まるメソッドを作ることで、テストメソッドは好きなだけ作成できる（名前が重複してはだめ）
  - テストメソッドが複数ある場合、実行される順番はアルファベット順になる（並び順は関係なし）
  - テストメソッドを複数作るときは、それぞれが独立した内容であること（テストメソッド1の結果を使用して、テストメソッド2を行う、とかは独立性がないためダメ）
  

  ### testPerformanceExample():
   - パフォーマンステスト用のメソッド
   - コードの実行時間を計測して、パフォーマンスのベンチマークや改善点を確認できる
   - 必要ない場合は何も書かなくてもOK

### addTeardownBlock:
- テストメソッド内に記述するブロック
- tearDownメソッドのような、クリーンアップに関する処理を記述し、tearDownメソッドの代わりや補完として使用することが多い
- addTeardownBlockに追加されたブロックは、tearDownWithError()の後、tearDown()の前に実行される


### クラスレベルの各メソッドが呼び出される順番まとめ
1. class func setUp()  
2. [1サイクル目] setUp()またはsetUpWithError() -> 1つめのtestMethod -> addTeardownBlock -> tearDownWithError()またはtearDown()  
[2サイクル目] setUp()またはsetUpWithError() -> 2つめのtestMethod -> addTeardownBlock -> tearDownWithError()またはtearDown()  
[3サイクル目]  ...  
3. class func tearDown()
- setUpWithError()とsetUp()が両方存在している場合は、setUpWithError()が先に実行され、tearDownWithError()とtearDown()が両方存在している場合は、tearDown()が先に実行される

```Swift
import XCTest
@testable import UnitTesting

final class UnitTestingTests: XCTestCase {
        
///実行しても、テストは合格になるのでprint文は表示されず、ひし形アイコンが緑になる

    //実行順序1
    override class func setUp(){
        print("クラスメソッドのsetUp()が呼び出された")
    }
    
    //実行順序2
    override func setUpWithError() throws {
        print("インスタンスメソッドのsetUpWithError()が呼び出された")
    }
    
    //実行順序３
    override func setUp(){
        print("インスタンスメソッドのsetUp()が呼び出された")
    }
    
　　　　　　　　　//実行順序６
    override func tearDownWithError() throws {
        print("インスタンスメソッドのtearDownWithError()が呼び出された")
    }
    
　　　　　　　　　//実行順序７
    override func tearDown(){
        print("インスタンスメソッドのtearDown()が呼び出された")
    }

　　　　　　　　　//実行順序８
    override class func tearDown(){
        print("クラスメソッドのtearDown()が呼び出された")
    }

　　　　　　　　　//実行順序４
    func testExample() throws {
        print("テストメソッドのtestExample()が呼び出された")
	　//実行順序５
        addTeardownBlock {
            print("addTeardownBlockが呼び出された。このブロックは、tearDownWithError()メソッドの前に呼び出されます。")
        }
    }
}

```




## 動かしてみる
- ソースコード左にあるひし形が緑になったらテスト合格、赤くなったら不合格
- テスト合格の場合はprint文は表示されず、不合格の場合は表示される
### ソースコードから実行する方法
  - ファイルのコードの右側のひし形をクリックする
  - テストケースクラスの右側のひし形をクリックすると、クラス内のすべてのテストメソッドが実行される
  - テストメソッドを選んで実行したいときは、メソッドの隣のひし形をクリック
### Test Navigatorから実行する方法
  - ソースツリー上部の横に並んだアイコンから、ひし形マークを選択。表示された階層から対象を選択してテストを実行できる
### ショートカットで実行する方法
  - com + uでテストケースクラスのすべてのテストメソッドを実行
### Navigation Barから実行する方法
  - Product - Test (UITestも含めて全てのテストが実行される)
  
## 一部のテストを無効にしたい時
- ソースコードのひし形を右クリックし、Disable テスト名をクリックする。欠点：有効になっているのか無効になっているのかぱっと見わからない
- Test Navigatorのひし形を右クリックし、Disable テスト名をクリックする。無効になったメソッドは薄いグレーになる
- スキーマ - Test - 無効にしたいメソッドのチェックを外すことで無効にできる
- [func testxxxx]を[test_xxxx]みたいにアンダースコアで分けることでXcodeに認識されなくなり、無効にできる
### 詳しい結果を見たい時
ソースツリー上部の横に並んだアイコンから、レポートマークをクリック。テストの結果を日付ごとに確認できる。logからレポートメッセージが確認できる。失敗の記録の右の、横線が重なったアイコンをクリックするとコンソールの履歴も見れる

## 新しいテストケースクラスを追加で作成する
デフォルトで作成されたテストクラス以外を追加したい時
- com + n で新規作成 -> UnitTestCaseClassを検索して選択する -> テストクラス名(xxxxTests)を入れて、XCTestCaseのサブクラスになっているか確認しNext -> 新しいテストケースクラスを作成したいフォルダを選択する(すでに存在するUnitテスト用のフォルダを選択する) -> Targetsはひし形4つのアイコンのUnitTestsのみにチェック -> Create 
- 新しくテストケースクラス用のファイルが作成されるので、「@testable import プロジェクト名」を新しいファイルのimport行の下に記述する
### @testable importとは？
- テストコード用の特殊なコード
- テストターゲットからプログラム（モジュール）にアクセスできるようになり、変数などをテストコードで利用できる


## テストメソッドを作る時の約束
- testから始まるメソッド名にすること（そうしないとXcodeにテストメソッドだと認識されない）
- 引数を受け取らないこと
- 戻り値を返さないこと
#### 名付けについて
testから始まる以外に必須のルールはないが、iOS開発では一般的に下記のパターンとなることが多い
**test[関数名やクラス名など、テストの対象となるシステムの名前]\_[何が起きたら]\_[どのような結果を期待しているか等合格の条件]**
