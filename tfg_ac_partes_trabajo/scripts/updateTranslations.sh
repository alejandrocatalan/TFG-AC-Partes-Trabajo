if ! type "twine" > /dev/null; then
  # install foobar here
  echo "You must install Twine to continue ([sudo] gem install twine)"
  exit 1
fi

#generate from file
twine generate-localization-file translations/strings.txt assets/lang/app_en.arb --format jquery --lang en --tags ios
twine generate-localization-file translations/strings.txt assets/lang/app_es.arb --format jquery --lang es --tags ios
