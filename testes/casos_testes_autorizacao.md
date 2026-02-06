# Casos de Teste – Autorização de Exames

## Objetivo
Validar as regras de negócio do módulo de Autorização de Exames, garantindo que apenas beneficiários ativos, com exames cobertos e dados válidos, consigam obter autorização.

---

## CT-01 – Autorizar exame com sucesso

### Pré-condições
- Beneficiário com status *ATIVO*
- Beneficiário possui plano com cobertura para o exame
- Sistema disponível

### Dados de Teste
- Beneficiário: Noemia Silva
- Status: ATIVO
- Exame: EXAME_HEMOGRAMA
- Data da autorização: 01/04/2026

### Passos
1. Acessar o sistema
2. Navegar até o módulo *Autorização de Exames*
3. Selecionar o beneficiário ATIVO
4. Selecionar o exame coberto
5. Informar uma data válida
6. Clicar em *Salvar*

### Resultado Esperado
- Autorização salva com sucesso
- Mensagem de confirmação exibida ao usuário

### Critérios de Aceitação
- A autorização deve ser persistida no banco de dados
- O sistema deve confirmar a operação sem erros

---

## CT-02 – Bloquear autorização para beneficiário INATIVO

### Pré-condições
- Beneficiário com status *INATIVO*

### Dados de Teste
- Beneficiário: Noemia Silva
- Status: INATIVO
- Exame: EXAME_HEMOGRAMA
- Data da autorização: 15/11/2026

### Passos
1. Acessar o sistema
2. Navegar até *Autorização de Exames*
3. Selecionar beneficiário INATIVO
4. Selecionar exame
5. Informar data válida
6. Clicar em *Salvar*

### Resultado Esperado
- Autorização não deve ser salva
- Mensagem informando que o beneficiário está inativo

### Critérios de Aceitação
- Nenhum registro deve ser salvo
- Mensagem clara e objetiva deve ser exibida

---

## CT-03 – Bloquear autorização para exame não coberto

### Pré-condições
- Beneficiário ATIVO
- Exame não coberto pelo plano

### Dados de Teste
- Beneficiário: Noemia Silva
- Status: ATIVO
- Exame: EXAME_RESSONANCIA
- Data da autorização: 05/02/2026

### Passos
1. Acessar o sistema
2. Navegar até *Autorização de Exames*
3. Selecionar beneficiário ATIVO
4. Selecionar exame não coberto
5. Informar data válida
6. Clicar em *Salvar*

### Resultado Esperado
- Autorização não deve ser salva
- Mensagem informando ausência de cobertura

### Critérios de Aceitação
- Sistema deve impedir a autorização
- Usuário deve ser informado do motivo

---

## CT-04 – Validar data inválida para autorização

### Pré-condições
- Beneficiário ATIVO
- Exame coberto

### Dados de Teste
- Beneficiário: Noemia Silva
- Exame: EXAME_HEMOGRAMA
- Data da autorização: 05/10/2025 (data passada)

### Passos
1. Acessar o sistema
2. Navegar até *Autorização de Exames*
3. Selecionar beneficiário
4. Selecionar exame
5. Informar data inválida
6. Clicar em *Salvar*

### Resultado Esperado
- Autorização não deve ser salva
- Mensagem de validação de data exibida

### Critérios de Aceitação
- O sistema deve validar datas inválidas
- Nenhum registro deve ser persistido


# Automação de Testes

## Objetivo
Demonstrar, por meio de pseudo-código, a automação dos principais fluxos do módulo de Autorização de Exames, contemplando cenários de sucesso e falha conforme regras de negócio.

---

## Ferramentas (exemplo)
- Framework: Cypress / Selenium / Playwright 
- Abordagem: BDD
- Execução: Pipeline CI/CD (opcional)

---

## Cenários Automatizados – Autorização de Exames

### Regras de Negócio
- Beneficiário *ATIVO* pode receber autorização, desde que o exame seja coberto e a data válida
- Beneficiário *INATIVO* não pode receber autorização em nenhuma hipótese

---

### Pseudo-código (Cenário A e Cenário B)

```pseudo
CENÁRIO: Solicitar autorização de exame

DADO que o usuário esteja autenticado no sistema
E que exista um beneficiário com status definido (ATIVO ou INATIVO)
E que o exame selecionado seja válido
E que a data informada seja válida

QUANDO o usuário acessar o módulo de Autorização de Exames
E selecionar o beneficiário
E selecionar o exame
E informar a data
E clicar no botão "Salvar"

ENTÃO SE o beneficiário estiver com status ATIVO
    ENTÃO o sistema deve salvar a autorização
    E deve exibir uma mensagem de confirmação de sucesso
    E o registro deve existir no banco de dados

SENÃO SE o beneficiário estiver com status INATIVO
    ENTÃO o sistema não deve salvar a autorização
    E deve exibir uma mensagem informando que o beneficiário está inativo
    E nenhum registro deve ser criado no banco de dados
