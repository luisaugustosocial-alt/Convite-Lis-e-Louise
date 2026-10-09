-- Execute este arquivo no SQL Editor do seu projeto Supabase.
create table if not exists public.event_settings (
  id integer primary key check (id = 1),
  event_date text not null default 'Data a confirmar',
  event_time text not null default 'Horário a confirmar',
  event_place text not null default 'Local a confirmar',
  welcome_text text not null default 'Nosso maior doce é celebrar a vida com você!',
  photo_url text,
  updated_at timestamptz not null default now()
);
insert into public.event_settings (id) values (1) on conflict (id) do nothing;

create table if not exists public.rsvps (
  id bigint generated always as identity primary key,
  full_name text not null check (char_length(full_name) between 1 and 120),
  companions jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now()
);

alter table public.event_settings enable row level security;
alter table public.rsvps enable row level security;

drop policy if exists "Public can read event settings" on public.event_settings;
create policy "Public can read event settings" on public.event_settings for select to anon, authenticated using (true);
drop policy if exists "Authenticated admins can manage event settings" on public.event_settings;
create policy "Authenticated admins can manage event settings" on public.event_settings for all to authenticated using (auth.uid() is not null) with check (auth.uid() is not null);

drop policy if exists "Guests can submit RSVP" on public.rsvps;
create policy "Guests can submit RSVP" on public.rsvps for insert to anon, authenticated with check (char_length(full_name) between 1 and 120);
drop policy if exists "Authenticated admins can read RSVPs" on public.rsvps;
create policy "Authenticated admins can read RSVPs" on public.rsvps for select to authenticated using (auth.uid() is not null);

grant select on public.event_settings to anon, authenticated;
grant insert on public.rsvps to anon, authenticated;
grant select on public.rsvps to authenticated;
grant usage, select on sequence public.rsvps_id_seq to anon, authenticated;
grant insert, update on public.event_settings to authenticated;

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('party-images', 'party-images', true, 8388608, array['image/jpeg','image/png','image/webp'])
on conflict (id) do update set public = true, file_size_limit = 8388608, allowed_mime_types = array['image/jpeg','image/png','image/webp'];

drop policy if exists "Public can view party images" on storage.objects;
create policy "Public can view party images" on storage.objects for select to anon, authenticated using (bucket_id = 'party-images');
drop policy if exists "Authenticated admins can upload party images" on storage.objects;
create policy "Authenticated admins can upload party images" on storage.objects for insert to authenticated with check (bucket_id = 'party-images');
drop policy if exists "Authenticated admins can update party images" on storage.objects;
create policy "Authenticated admins can update party images" on storage.objects for update to authenticated using (bucket_id = 'party-images') with check (bucket_id = 'party-images');
