# ingestao4
Atividade da matéria de ingestão de dados do curso de Pós Graduação da PECE/POLI


# Objetivo

O objetivo da atividade é realizar a ingestão de dados de 3 pastas diferentes, tratá-los via Spark e então transformá-los via dbt para consumo.

# Estrutura

`Raw.ipynb` - Jupyter notebook para padronização dos dados camada Raw \
`Trusted.ipynb` - Jupyter notebook para salvar dados (camada Trusted) no banco de dados postgreSQL \
`dbt/atividade4` - Pasta com o projeto dbt \
`Dados/Bancos` - Pasta com arquivo original de bancos \
`Dados/Empregados` - Pasta com arquivo original de Empregados \
`Dados/Reclamações` - Pasta com arquivo original de Reclamações \

# Observações

O projeto utiliza arquivos de variáveis de ambiente para conexão com o banco de dados, caso faça um pull do projeto será necessário criar os arquivos `.env`

