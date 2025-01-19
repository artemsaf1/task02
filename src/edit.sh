#!/bin/bash

FILE="history_of_vim.txt"
STROKA="1992        - Vim 1.22: Port to Unix.  Vim now competes with Vi."
RSTROKA="1993        - Vim 1.22: Port to Unix.  Vim now competes with Vi."
LOG_FILE="files.log"

if [ ! -e "$FILE" ]; then
echo Ошибка: Файла нет
exit 1
fi

if [ ! -w "$FILE" ]; then 
echo Ошибка: Невозможно записать данные
exit 1
fi

BACKFILE="${FILE}back.txt"
cp "$FILE" "$BACKFILE"

sed -i '' "s/$STROKA/$RSTROKA/g" $FILE
EXIT=$?

if [ $EXIT -ne 0 ]; then
echo Ошибка: чето не получилось
exit 1
fi

FILE_SIZE=$(stat -f%z "$FILE")
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
HASH=$(shasum -a 256 "$FILE" | awk '{print $1}')
echo "$FILE - $FILE_SIZE - $TIMESTAMP - $STROKA -> $RSTROKA - $HASH" >> "$LOG_FILE"

echo "Замена завершена. Изменения тут: $LOG_FILE."
exit 0