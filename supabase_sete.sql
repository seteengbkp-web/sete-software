-- SETE · estrutura da nuvem 
-- Cole no SQL Editor do projeto Supabase da SETE e clique em Run.
create table if not exists public.sete_registros (
  uid text not null,
  org text not null default 'SETE',
  store text not null,
  dados jsonb not null default '{}'::jsonb,
  deletado boolean not null default false,
  atualizado_em timestamptz not null default now(),
  primary key (org, store, uid)
);
create index if not exists sete_registros_sync_idx on public.sete_registros (org, atualizado_em);
alter table public.sete_registros enable row level security;
drop policy if exists sete_registros_acesso on public.sete_registros;
create policy sete_registros_acesso on public.sete_registros for all using (true) with check (true);

insert into storage.buckets (id, name, public) values ('sete-fotos', 'sete-fotos', true)
on conflict (id) do update set public = true;
drop policy if exists sete_fotos_ler on storage.objects;
drop policy if exists sete_fotos_enviar on storage.objects;
drop policy if exists sete_fotos_trocar on storage.objects;
drop policy if exists sete_fotos_apagar on storage.objects;
create policy sete_fotos_ler    on storage.objects for select using (bucket_id = 'sete-fotos');
create policy sete_fotos_enviar on storage.objects for insert with check (bucket_id = 'sete-fotos');
create policy sete_fotos_trocar on storage.objects for update using (bucket_id = 'sete-fotos') with check (bucket_id = 'sete-fotos');
create policy sete_fotos_apagar on storage.objects for delete using (bucket_id = 'sete-fotos');
