# UnitTest

## UnitTestとは
- 単体テストのこと
- コードの一部をテストするために作成する非常に小さな自己完結型のメソッド
- 単体テストのコードは非常にシンプルで小さい、複数ある
- 特定の入力パラメータを使用して関数を呼び出し、テストの対象から帰ってきた結果を検証する
- 1つのテストで1つの機能を検証する、複数の機能を1つの単体テストで検証するのはNG
- 作成するには、XCTest Frameworkを使うのが良い、テストにクリアすると緑のチェックボックスが、クリアしないと赤い❌が出る
- ダミーのオブジェクトを使用し依存関係がないため高速で実行される

## Testの階層
Unit Tests - Integration Tests - UI Tests
Unit Testsはすべてのテストの前に実行される





### 見出し3

- リスト1
    - a
    - b
- リスト2
- リスト3

1. 数字付きリスト1
2. 数字付きリスト2
3. 数字付きリスト3

**太字**、*斜体*、~~取り消し線~~

区切り線
--- 
___
***

```
function test() {
  console.log("notice the blank line before this function?");
}
```

[リンクのテキスト](http://example.com)

>>>>>>Hello World


- [ ] タスク1
- [x] タスク2


```ruby:ファイル名
puts 'The best way to log and share programmers knowledge.'
```

| Head | Head | Head |
| ---- | ---- | ---- |
| Text | Text | Text |
| Text | Text | Text |

> 引用文
> 引用文

:::message
メッセージをここに
:::

:::message alert
警告メッセージをここに
:::

### アコーディオン（トグル）
:::details タイトル
表示したい内容
:::
