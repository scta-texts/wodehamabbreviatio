for dir in */
  do
    for file in $dir/*
      do
        schema=$(grep -o "lbp-.*-1.0.0" $file)
      if [[ $file = *"transcriptions.xml"* ]]; then
        jing ~/Desktop/tdf.rng $file
        echo $file
      elif [[ $schema = *"diplomatic"* ]]; then
        echo "checking diplomatic for $file"
        jing ~/Desktop/diplomatic.rng $file
      elif [[ $schema = *"critical"* ]]; then
        echo "checking critical for $file"
        jing ~/Desktop/critical.rng $file
      fi
    done
  done
  #test change
