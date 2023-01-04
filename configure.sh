#!/bin/bash

defaults write com.apple.touchbar.agent PresentationModeGlobal appWithControlStrip 

defaults write -g com.apple.swipescrolldirection -boolean false;

defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -boolean false;

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -boolean false;

defaults write com.apple.dock tilesize 37;

defaults write com.apple.dock autohide -boolean true;