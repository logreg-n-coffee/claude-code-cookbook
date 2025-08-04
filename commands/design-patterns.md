## Design Patterns

Propose applicable design patterns for the codebase and evaluate SOLID principle compliance.

### Usage

```bash
/design-patterns [analysis_target] [options]
```

### Options

- `--suggest` : Propose applicable patterns (default)
- `--analyze` : Analyze usage of existing patterns
- `--refactor` : Generate refactoring proposals
- `--solid` : Check SOLID principle compliance
- `--anti-patterns` : Detect anti-patterns

### Basic Examples

```bash
# Project-wide pattern analysis
/design-patterns

# Pattern suggestions for specific file
/design-patterns src/services/user.js --suggest

# SOLID principle check
/design-patterns --solid

# Anti-pattern detection
/design-patterns --anti-patterns
```

### Analysis Categories

#### 1. Creational Patterns

- **Factory Pattern**: Object creation abstraction
- **Builder Pattern**: Staged construction of complex objects
- **Singleton Pattern**: Instance uniqueness guarantee
- **Prototype Pattern**: Object clone creation

#### 2. Structural Patterns

- **Adapter Pattern**: Interface conversion
- **Decorator Pattern**: Dynamic feature addition
- **Facade Pattern**: Simplification of complex subsystems
- **Proxy Pattern**: Object access control

#### 3. Behavioral Patterns

- **Observer Pattern**: Event notification implementation
- **Strategy Pattern**: Algorithm switching
- **Command Pattern**: Operation encapsulation
- **Iterator Pattern**: Collection traversal

### SOLID Principle Check Items

```
S - Single Responsibility Principle
O - Open/Closed Principle
L - Liskov Substitution Principle
I - Interface Segregation Principle
D - Dependency Inversion Principle
```

### Output Example

```
Design Pattern Analysis Report
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Currently Used Patterns
├─ Observer Pattern: EventEmitter (12 locations)
├─ Factory Pattern: UserFactory (3 locations)
├─ Singleton Pattern: DatabaseConnection (1 location)
└─ Strategy Pattern: PaymentProcessor (5 locations)

Recommended Patterns
├─ [HIGH] Repository Pattern
│  └─ 対象: src/models/*.js
│  └─ 理由: データアクセスロジックの分離
│  └─ 例:
│      class UserRepository {
│        async findById(id) { ... }
│        async save(user) { ... }
│      }
│
├─ [MED] Command Pattern
│  └─ 対象: src/api/handlers/*.js
│  └─ 理由: リクエスト処理の統一化
│
└─ [LOW] Decorator Pattern
   └─ 対象: src/middleware/*.js
   └─ 理由: 機能の組み合わせ改善

SOLID 原則違反
├─ [S] UserService: 認証と権限管理の両方を担当
├─ [O] PaymentGateway: 新決済手段追加時に修正必要
├─ [D] EmailService: 具象クラスに直接依存
└─ [I] IDataStore: 使用されないメソッドを含む

リファクタリング提案
1. UserService を認証と権限管理に分割
2. PaymentStrategy インターフェースの導入
3. EmailService インターフェースの定義
4. IDataStore を用途別に分離
```

### 高度な使用例

```bash
# パターン適用の影響分析
/design-patterns --impact-analysis Repository

# 特定パターンの実装例生成
/design-patterns --generate Factory --for src/models/Product.js

# パターンの組み合わせ提案
/design-patterns --combine --context "API with caching"

# アーキテクチャパターンの評価
/design-patterns --architecture MVC
```

### パターン適用例

#### Before (問題のあるコード)

```javascript
class OrderService {
  processOrder(order, paymentType) {
    if (paymentType === "credit") {
      // クレジットカード処理
    } else if (paymentType === "paypal") {
      // PayPal 処理
    }
    // 他の決済方法...
  }
}
```

#### After (Strategy Pattern 適用)

```javascript
// 戦略インターフェース
class PaymentStrategy {
  process(amount) {
    throw new Error("Must implement process method");
  }
}

// 具象戦略
class CreditCardPayment extends PaymentStrategy {
  process(amount) {
    /* 実装 */
  }
}

// コンテキスト
class OrderService {
  constructor(paymentStrategy) {
    this.paymentStrategy = paymentStrategy;
  }

  processOrder(order) {
    this.paymentStrategy.process(order.total);
  }
}
```

### アンチパターン検出

- **God Object**: 過度に多くの責務を持つクラス
- **Spaghetti Code**: 制御フローが複雑に絡み合ったコード
- **Copy-Paste Programming**: 重複コードの過度な使用
- **Magic Numbers**: ハードコードされた定数
- **Callback Hell**: 深くネストしたコールバック

### ベストプラクティス

1. **段階的適用**: 一度に多くのパターンを適用しない
2. **必要性の検証**: パターンは問題解決の手段であり目的ではない
3. **チーム合意**: パターン適用前にチームで議論
4. **ドキュメント化**: 適用したパターンの意図を記録
