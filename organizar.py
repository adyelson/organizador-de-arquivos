import os
from typing import OrderedDict
import shutil
# script para organizar arquivos de exportação sagitário 2.3

origem="IMP_EXP"
destino="TODAS_BASES"
arquivozip="ZIP_TODAS_BASES"

if os.path.isdir(destino):
  exit
else:  
  os.mkdir(destino)
arquivos = os.listdir(origem)
nome = []
for arq in arquivos:
  nome = nome + [arq.split("_")[0]]

bases = OrderedDict.fromkeys((nome))

for base in bases:
  if os.path.isdir(f"{destino}/{base}"):
    exit
  else:
    os.mkdir(f"{destino}/{base}")
  for arq in arquivos:
    if base == str(arq.split("_")[0]):
      os.replace(f'{origem}/{arq}',f'{destino}/{base}/{arq}')

os.rmdir(origem)
shutil.make_archive('BASES', 'zip', './', destino)