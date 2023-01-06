#!/bin/bash

set -e;

# Touchbar
echo "Modifying touchbar to present function keys."
plutil -replace PresentationModeFnModes.appWithControlStrip -string functionKeys ~/Library/Preferences/com.apple.touchbar.agent.plist
plutil -replace PresentationModeGlobal -string functionKeys ~/Library/Preferences/com.apple.touchbar.agent.plist

echo "Disabling touchbar typing suggestions."
defaults write -globalDomain NSAutomaticTextCompletionEnabled -int 0

# Trackpad
echo "Disabling trackpad natural scrolling."
defaults write -g com.apple.swipescrolldirection -boolean false;

echo "Disabling trackpad smart zoom."
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -boolean false;
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -boolean false;

# Dock
echo "Resizing dock."
defaults write com.apple.dock tilesize 37;

echo "Enabling dock autohide."
defaults write com.apple.dock autohide -boolean true;

# Chrome
echo "Disabling Chrome swipe navigation."
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false;

echo "Configuration complete. Some changes might take effect after a new log-in."