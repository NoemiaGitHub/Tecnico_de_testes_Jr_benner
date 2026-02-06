# 🐞 Bug Report – Erro ao salvar autorização

## Título
Erro intermitente ao salvar autorização de exame após atualização do módulo

---

## Contexto
Após a atualização do módulo de Autorização de Exames, usuários relatam falhas intermitentes ao salvar autorizações, mesmo quando todos os dados informados são válidos (beneficiário ativo, exame coberto e data válida).

---

## Passos para Reproduzir
1. Acessar o sistema  
2. Navegar até o módulo *Autorização de Exames*  
3. Selecionar um beneficiário com status *ATIVO*  
4. Selecionar um exame *coberto pelo plano*  
5. Informar uma *data válida* para a autorização  
6. Clicar no botão *Salvar*  
7. Repetir o processo algumas vezes  

---

## Resultado Atual
- A autorização não é salva  
- Em alguns casos, nenhuma mensagem é exibida  
- Em outros casos, é exibida uma mensagem genérica de erro  

---

## Resultado Esperado
- A autorização deve ser salva com sucesso  
- O sistema deve exibir uma mensagem clara de confirmação da operação  

---

## Severidade
Alta

---

## Prioridade
Alta

---

## Ambiente
- Ambiente: Homologação  
- Versão do sistema: 3.64  
- Navegador: Google Chrome  

---

## Logs / Evidências

```text
[ERROR] 500 - Erro interno ao salvar autorização
Endpoint: /api/autorizacoes
Mensagem: Falha ao persistir autorização no banco de dados
Exception: NullPointerException
Classe: AutorizacaoService
Método: salvarAutorizacao()
Timestamp: 2026-02-05 23:20:00
