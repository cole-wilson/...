rm -rf ~/Library/Caches/CocoaPods
rm -rf ~/Library/Caches/org.carthage.CarthageKit
xcrun simctl delete unavailable
rm -rf ~/Library/Developer/Xcode/Archives
rm -rf ~/Library/Developer/Xcode/DerivedData
rm -rf ~/Library/Developer/Xcode/iOS\ Device\ Logs
rm -rf ~/.logins/*
brew cleanup

open -a GrandPerspective
