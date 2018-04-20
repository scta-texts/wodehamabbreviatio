for file in */*
  do
    schema=$(grep -o "lbp-.*-1.0.0" $file)
  if [[ $file = *"transcriptions.xml"* ]]; then
    jing ~/Desktop/tdf.rng $file
    if [[ $? != 0 ]]
    $status=$?
    fi
    echo $file
  elif [[ $schema = *"diplomatic"* ]]; then
    echo "checking diplomatic for $file"
    jing ~/Desktop/diplomatic.rng $file
    if [[ $? != 0 ]]
    $status=$?
    fi
  elif [[ $schema = *"critical"* ]]; then
    echo "checking critical for $file"
    jing ~/Desktop/critical.rng $file
    if [[ $? != 0 ]]
    $status=$?
    fi
  fi
done
exit $status
