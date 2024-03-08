
Yang 是根据 [SnapKit](https://github.com/SnapKit/SnapKit) 修改而来的。
Yang 目前只支持 iOS 。

## 内容

- 要求
- 安装
- 例子

## 要求

- iOS 12+
- Xcode 15+
- Swift 5+

## 安装

### Swift Package
```swift
dependencies: [
    .package(url: "https://github.com/huangwenfei/Yang.git", .upToNextMajor(from: "0.0.1"))
]
```

### Cocoapods
```ruby
target '<Your Target Name>' do
    pod 'Yang'
end
```

## 例子

具体可以查看 Yang-Examples 工程。

### 注意点
```swift

someLayoutItem.yang.addToParent(...)
someLayoutItem.yang.removeFromParent()

```

`addToParent` 内部会自动保存 `translatesAutoresizingMaskIntoConstraints` 的状态。
`removeFromParent` 内部会重置之前保存的 `translatesAutoresizingMaskIntoConstraints` 的状态。

当然也可以手动设置：
```swift

parentView.addSubview(someLayoutItem)
someLayoutItem.yang.saveState()

/// some yang layout code

someLayoutItem.removeFromSuperview()
someLayoutItem.yang.resetState()

```

### 基础

```swift

let parentView = ...

let yellow = YellowView()
yellow.yang.addToParent(parentView)

#if false
yellow.yang.edge
    .equalToParent()
    .identifier("yellow-edge")
    .active()
    
#else
yellow.yang.left.equalToParent().identifier("yellow-left").offset(16).active()
yellow.yang.right.equalToParent().identifier("yellow-right").offset(-16).active()
yellow.yang.top.equalToParent().identifier("yellow-top").offset(16).active()

yellow.yang.height
    .equal(to: 50)
    .identifier("yellow-height")
    .active()
#endif

```

### 基础 - 更新

```swift

let parentView = ...

let yellow = YellowView()
yellow.yang.addToParent(parentView)

yellow.yang.left.equalToParent().identifier("yellow-left").offset(16).active()
yellow.yang.right.equalToParent().identifier("yellow-right").offset(-16).active()
yellow.yang.top.equalToParent().identifier("yellow-top").offset(16).active()

let yellowH = yellow.yang.height
    .equal(to: 50)
    .identifier("yellow-height")
    .active()

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    yellowH.updater.offset(280).active()
    self.view.setNeedsUpdateConstraints()
}

```

### 批量

```swift

let parentView = ...

let yellow = YellowView()
yellow.yang.addToParent(parentView)

yellow.yangbatch.make { make in
    make.left.equalToParent().identifier("yellow-left").offset(46)
    make.right.equalToParent().identifier("yellow-right").offset(-46)
    make.top.equalToParent().identifier("yellow-top").offset(46)
    make.height.equal(to: 150).identifier("yellow-height")
}

```

### 批量 - 更新

```swift

let parentView = ...

let yellow = YellowView()
yellow.yang.addToParent(parentView)

yellow.yangbatch.make { make in
    make.left.equalToParent().identifier("yellow-left").offset(16)
    make.right.equalToParent().identifier("yellow-right").offset(-16)
    make.top.equalToParent().identifier("yellow-top").offset(16)
    make.height.equal(to: 50).identifier("yellow-height")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    yellow.yangbatch.remake { make in
        make.left.right
            .equalToParent()
            .offsetEdge(40)
        make.top
            .equalToParent()
            .offset(100)
        make.bottom
            .equal(to: parentView.yangbatch.bottom)
            .offsetEdge(50)
    }
}

```

--- 

Yang is changed according to the [SnapKit](https://github.com/SnapKit/SnapKit).
Yang currently only supports iOS.

## Content

- Requirements
- Installation
- Examples

## Requirements

- iOS 12+
- Xcode 15+
- Swift 5+

## Installation

### Swift Package
```swift
dependencies: [
    .package(url: "https://github.com/huangwenfei/Yang.git", .upToNextMajor(from: "0.0.1"))
]
```

### Cocoapods
```ruby
target '<Your Target Name>' do
    pod 'Yang'
end
```

## Examples

Check out the Yang-Examples project.

### Pay attention
```swift

someLayoutItem.yang.addToParent(...)
someLayoutItem.yang.removeFromParent()

```

`addToParent` internal will automatically save `translatesAutoresizingMaskIntoConstraints` state.
`removeFromParent` internal will reset before save `translatesAutoresizingMaskIntoConstraints` state.

You can also set it manually:
```swift

parentView.addSubview(someLayoutItem)
someLayoutItem.yang.saveState()

/// some yang layout code

someLayoutItem.removeFromSuperview()
someLayoutItem.yang.resetState()

```

### Base

```swift

let parentView = ...

let yellow = YellowView()
yellow.yang.addToParent(parentView)

if false
yellow.yang.edge
    .equalToParent()
    .identifier("yellow-edge")
    .active()
    
#else
yellow.yang.left.equalToParent().identifier("yellow-left").offset(16).active()
yellow.yang.right.equalToParent().identifier("yellow-right").offset(-16).active()
yellow.yang.top.equalToParent().identifier("yellow-top").offset(16).active()

yellow.yang.height
    .equal(to: 50)
    .identifier("yellow-height")
    .active()
#endif

```

### Base - Update

```swift

let parentView = ...

let yellow = YellowView()
yellow.yang.addToParent(parentView)

yellow.yang.left.equalToParent().identifier("yellow-left").offset(16).active()
yellow.yang.right.equalToParent().identifier("yellow-right").offset(-16).active()
yellow.yang.top.equalToParent().identifier("yellow-top").offset(16).active()

let yellowH = yellow.yang.height
    .equal(to: 50)
    .identifier("yellow-height")
    .active()

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    yellowH.updater.offset(280).active()
    self.view.setNeedsUpdateConstraints()
}

```

### Batch

```swift

let parentView = ...

let yellow = YellowView()
yellow.yang.addToParent(parentView)

yellow.yangbatch.make { make in
    make.left.equalToParent().identifier("yellow-left").offset(46)
    make.right.equalToParent().identifier("yellow-right").offset(-46)
    make.top.equalToParent().identifier("yellow-top").offset(46)
    make.height.equal(to: 150).identifier("yellow-height")
}

```

### Batch - Update

```swift

let parentView = ...

let yellow = YellowView()
yellow.yang.addToParent(parentView)

yellow.yangbatch.make { make in
    make.left.equalToParent().identifier("yellow-left").offset(16)
    make.right.equalToParent().identifier("yellow-right").offset(-16)
    make.top.equalToParent().identifier("yellow-top").offset(16)
    make.height.equal(to: 50).identifier("yellow-height")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    yellow.yangbatch.remake { make in
        make.left.right
            .equalToParent()
            .offsetEdge(40)
        make.top
            .equalToParent()
            .offset(100)
        make.bottom
            .equal(to: parentView.yangbatch.bottom)
            .offsetEdge(50)
    }
}

```
