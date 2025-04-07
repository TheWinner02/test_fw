# Nome del file
file=a53/ROM/system/system/build.prop

# Parola da rimuovere
parola="# end of file"

# Usa sed per rimuovere la parola in ogni riga del file
sed -i "/$parola/d" "$file"

# Definisci il nome del file di destinazione
file=a53/ROM/system/system/build.prop

# Definisci il nome del file con le righe da aggiungere
file_da_aggiungere=a53/common/system/build.prop

# Aggiungi il contenuto del secondo file alla fine del primo
cat "$file_da_aggiungere" >> "$file"
