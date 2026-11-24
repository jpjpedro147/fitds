create table public.dias (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  dia date not null,
  dados jsonb not null default '{"tr":[],"ca":[],"di":[]}',
  primary key (user_id, dia)
);
alter table public.dias enable row level security;
create policy "dono acessa seus dias" on public.dias
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
