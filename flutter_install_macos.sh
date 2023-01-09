#!/bin/bash

mkdir src
choices=("USA" "China")
select choice in "${choices[@]}"; do
    case $choice in
        "USA")
            echo "USA"
            platform=("Intel Mac From Before 2020" "M1 Mac From After 2020")
            select plt in "${platform[@]}"; do
                case $plt in
                    "Intel Mac From Before 2020")
                        echo "Intel"
                        url="https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.3.10-stable.zip"
                        break
                        ;;
                    "M1 Mac From After 2020")
                        echo "M1"
                        url="https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_3.3.10-stable.zip"
                        break
                        ;;
                esac
            done 
            break
            ;;
        "China")
            echo "China"
            platform=("Intel Mac From Before 2020" "M1 Mac From After 2020")
            select plt in "${platform[@]}"; do
                case $plt in
                    "Intel Mac From Before 2020")
                        echo "Intel"
                        url="https://storage.flutter-io.cn/flutter_infra_release/releases/stable/macos/flutter_macos_3.3.10-stable.zip"
                        break
                        ;;
                    "M1 Mac From After 2020")
                        echo "M1"
                        url="https://storage.flutter-io.cn/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_3.3.10-stable.zip"
                        break
                        ;;
                esac
            done 
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

curl $url -o flutter.zip
cd src
unzip ../flutter.zip
cd $HOME
touch -c .bash_profile
echo export PATH="$PATH:$HOME/src/flutter/bin" >> .bash_profile
touch -c .zshrc
echo export PATH="$PATH:$HOME/src/flutter/bin" >> .zshrc
source $HOME/.zshrc