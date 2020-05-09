#删除每行前三个字符
#!/bin/bash

echo Has deletet first three chars in lines

#sed -i 's/^...//' "$1"
sed -i 's/^.\{3\}//' "$1"

##{n}n 是一个非负整数。匹配确定的 n 次。例如，'o{2}' 不能匹配 "Bob" 中的 'o'，但是能匹配 "food" 中#的两个 o。