#!/bin/bash
# script para organizar arquivos de exportação sagitário 2.3
local=$(pwd)
origem=IMP_EXP
destino=TODAS_BASES
nomearq=00_TODAS_BASES
pastas=$(ls $origem |awk -F'_'  '$1 {print  $1}'|sort|uniq|sort -nr)
qtd=$(ls $origem |awk -F'_'  '$1 {print  $1}'|sort|uniq|sort -n | wc -l)
array=($pastas)
echo $local
mkdir $destino

w=$(($qtd-1)) 
x=0

while [ $x -le $w ] # x<=w
do
   mkdir $destino/${array[$x]} # cria diretório com o o nome da base
   mv $origem/${array[$x]}* $destino/${array[$x]} # move todos os arquivos para a pasta com o nome correspondente
  x=$(($x+1))
done

zip -r $nomearq.zip $destino/* #compacta todas as pastas organizadas em um arquivo zip

echo -----------------------------------------------------
echo " As bases foram movidas e organizadas em $destino."
echo " Foi criado o arquivo $nomearq.zip em $local,"
echo " contendo todas as bases de $origem"
echo -----------------------------------------------------
sleep 5s