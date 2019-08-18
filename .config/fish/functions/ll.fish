function ll
    ls -l|sed "s/$date/TODAY  /g"
end
