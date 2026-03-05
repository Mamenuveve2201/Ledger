-- Run this in your Supabase SQL Editor
-- Go to: https://supabase.com/dashboard/project/uvqjswdfcixwktgvnzbq/sql/new

-- 1. Create the user_data table
create table if not exists public.user_data (
  id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}',
  updated_at timestamptz default now()
);

-- 2. Enable Row Level Security
alter table public.user_data enable row level security;

-- 3. Policy: users can only read/write their own data
drop policy if exists "Users manage own data" on public.user_data;
create policy "Users manage own data"
  on public.user_data
  for all
  using (auth.uid() = id)
  with check (auth.uid() = id);

-- 4. Grant access
grant all on public.user_data to authenticated;
grant all on public.user_data to service_role;
