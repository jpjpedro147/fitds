# FitDs

Diário fitness com login: registre **treinos**, **cardio** e **dieta** (6 refeições, calorias e proteína), com meta diária e gráfico dos últimos 7 dias.

## Tecnologias

- HTML, CSS e JavaScript (arquivo único, sem build)
- [Supabase](https://supabase.com): autenticação e banco de dados (PostgreSQL)
- [Netlify](https://netlify.com): hospedagem

## Estrutura

```
fitds/
├── index.html     # site completo (login + painel)
├── supabase.sql   # tabela e regras de segurança
└── README.md
```

## Como configurar

1. Crie um projeto no Supabase.
2. Em **SQL Editor**, rode o conteúdo de `supabase.sql`.
3. Em **Project Settings → API**, copie a **Project URL** e a chave **anon public**.
4. No topo do script do `index.html`, substitua:

   ```js
   var CFG={url:"COLE_AQUI_A_URL",key:"COLE_AQUI_A_ANON_KEY"};
   ```

5. (Opcional) Em **Authentication → Providers → Email**, desative **Confirm email** para entrar sem confirmar o e-mail.

## Deploy na Netlify

- **Pelo GitHub:** Add new site → Import an existing project → GitHub → repositório `fitds` → Deploy.
- **Manual:** arraste a pasta `fitds` em [app.netlify.com/drop](https://app.netlify.com/drop).

Depois, no Supabase, em **Authentication → URL Configuration**, coloque o link do site em **Site URL**.

## Segurança

- A chave **anon** pode ficar no código; a proteção vem do RLS (Row Level Security), que deixa cada usuário ver apenas os próprios dados.
- Nunca use a chave **service_role** no site nem no GitHub.

## Banco de dados

Tabela `dias`: uma linha por usuário e por dia, com os dados do treino, cardio e dieta em `jsonb`.

| Coluna    | Tipo  | Descrição                    |
|-----------|-------|------------------------------|
| `user_id` | uuid  | Dono do registro (`auth.uid()`) |
| `dia`     | date  | Data do registro             |
| `dados`   | jsonb | `{ tr: [], ca: [], di: [] }` |
