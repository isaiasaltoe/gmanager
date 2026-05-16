# gManager

Sistema interno de backoffice para equipes de desenvolvimento freelance. Centraliza a gestão de clientes, projetos, pagamentos e membros do time em uma única plataforma.

## Motivação

Quero uma solução simples para gerir meus projetos de freelance, uni essa necessidade com uma oportunidade de aprender mais

## O que o sistema faz

- **Times** — um usuário pode criar um time e convidar outros membros. Cada usuário pertence a apenas um time por vez.
- **Clientes** — cadastro completo de clientes vinculados ao time, com dados de contato e endereço.
- **Projetos e Kanban** — cada time possui um quadro Kanban central com 5 colunas fixas: Coletando Requisitos, Em Espera, Em Desenvolvimento, Em Onboarding e Projeto Entregue.
- **Controle de acesso** — membros só visualizam os projetos aos quais foram atribuídos. O criador do time tem acesso irrestrito.
- **Financeiro** — cada projeto possui valor total e número de parcelas. As parcelas são geradas automaticamente e seu status é controlado manualmente pela equipe.
- **Convites** — o dono do time pode convidar membros pelo portal, sem necessidade de e-mail externo.

## Modelagem do banco de dados

O banco foi pensado para ser simples, sem multitenancy complexo. Todas as entidades compartilham o mesmo banco de dados e o isolamento entre times é feito por relacionamentos diretos.

Decisões principais:

- `users` tem `team_id` nullable — o usuário existe antes do time.
- `teams` tem `creator_id` apontando para `users` — define o dono do time sem necessidade de um sistema de roles global.
- `clients` pertence ao `team` em relação 1:N — times diferentes podem ter o mesmo cliente como registros separados, garantindo isolamento total.
- `projects` pertence ao `team` e ao `client`, com `status` como enum representando as colunas do Kanban.
- `user_projects` é a tabela intermediária N:N entre usuários e projetos — um membro só acessa os projetos aos quais foi atribuído.
- `installments` é gerada automaticamente pelo sistema a partir de `total_value` e `installments_qty` definidos no projeto.
- `invites` registra convites pendentes dentro do portal, sem integração com e-mail externo por enquanto.

## Tecnologias

- **Ruby on Rails 8.1** — framework principal (API + backend)
- **PostgreSQL** — banco de dados relacional
- **Devise** — autenticação de usuários


## Configuração local

em breve
