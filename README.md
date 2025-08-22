# Yang

- Yang is changed according to the [SnapKit](https://github.com/SnapKit/SnapKit).
- Yang currently only supports iOS.

# Requirements

- iOS 12+
- Xcode 15+
- Swift 5+

# Installation

## Swift Package
```swift
dependencies: [
    .package(url: "https://github.com/huangwenfei/Yang.git", .upToNextMajor(from: "0.0.1"))
]
```

## Cocoapods
```ruby
target '<Your Target Name>' do
    pod 'Yang'
end
```

## Pay attention

Normally

```swift

someLayoutItem.yang.addToParent(...)
someLayoutItem.yang.removeFromParent()

```

- `addToParent` internal will automatically save `translatesAutoresizingMaskIntoConstraints` state.
- `removeFromParent` internal will reset before save `translatesAutoresizingMaskIntoConstraints` state.

You can also set it manually:
```swift

parentView.addSubview(someLayoutItem)
someLayoutItem.yang.saveState()

/// some yang layout code

someLayoutItem.removeFromSuperview()
someLayoutItem.yang.resetState()

```

# Usage

## Base

<img width="301.5" height="655.5" alt="Base" src="https://github.com/user-attachments/assets/d7afb5f9-0a00-41ed-ba15-5b78f5f3b345" />
<img width="301.5" height="655.5" alt="Base1" src="https://github.com/user-attachments/assets/54a9af88-1696-45f1-8019-3d2c5ec2c475" />
<img width="301.5" height="655.5" alt="Base2" src="https://github.com/user-attachments/assets/a3dc7a8c-22d1-4812-971f-abfd34828bce" />


</br>

```swift

let yellow = YellowView()
yellow.yang.addToParent(parentView)

let red = RedView()
red.yang.addToParent(parentView)

/// Base
yellow.yang.edge
    .equalToParent()
    .identifier("yellow-edge")
    .active()

/// Base 1

yellow.yang.left.equalToParent().identifier("yellow-left").offset(16).active()
yellow.yang.right.equalToParent().identifier("yellow-right").offset(-16).active()
yellow.yang.top.equalToParent().identifier("yellow-top").offset(16).active()

yellow.yang.height
    .equal(to: 50)
    .identifier("yellow-height")
    .active()

/// Base 2
yellow.yang.left.equalToParent().identifier("yellow-left").offset(16).active()
yellow.yang.right.equalToParent().identifier("yellow-right").offset(-16).active()
yellow.yang.top.equalToParent().identifier("yellow-top").offset(16).active()

yellow.yang.height
    .equal(to: 50)
    .identifier("yellow-height")
    .active()

red.yang.top.equal(to: yellow.yang.bottom).offset(16).identifier("red-top = yellow.bottom").active()
red.yang.height.equal(to: yellow).identifier("red-height = yellow.height").active()
red.yanglink.leading.trailing.equal(to: yellow).identifier("red-leading-trailing = yellow-leading-trailing").active()

```

## Base - Update

![Base-Update](https://github.com/user-attachments/assets/2ca44e3b-2d29-4430-b237-633353cce77c)

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
    /// set new value
    yellowH.updater.offset(280)
    /// update it
    yellowH.updater.updateAnimateIfCan(configs: .init())
}

```

## Batch

<img width="301.5" height="655.5" alt="Batch" src="https://github.com/user-attachments/assets/e89db297-5a6e-489c-bcf5-614450b18ec3" />

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

## Batch - Update

![Batch-Update](https://github.com/user-attachments/assets/96e40f76-ca54-4f02-bb77-6bbac467bee5)


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
    yellow.yangbatch.updateAnimate({ make in
        make.left.offsetEdge(140)
        make.right.offsetEdge(140)
        make.top.offset(100)
    }, animateConfigs: .init())
}

```
