# LEDGER — Setup Instructions

## Step 1: Create the Database Table (ONE TIME ONLY)

1. Go to: https://supabase.com/dashboard/project/uvqjswdfcixwktgvnzbq/sql/new
2. Paste the contents of `supabase-setup.sql` and click **Run**

## Step 2: Disable Email Confirmation (Recommended)

Without this, every new sign-up requires clicking a confirmation email.

1. Go to: https://supabase.com/dashboard/project/uvqjswdfcixwktgvnzbq/auth/providers
2. Click **Email** provider
3. Turn OFF **"Confirm email"**
4. Save

## Step 3: Deploy to Netlify

Drag the entire contents of this zip onto https://app.netlify.com/drop

## Signing In

- **Create Account** → enter email + password (6+ chars)
- If email confirmation is ON, check your email and click the link first
- Then sign in with the same credentials

## Troubleshooting

- **"Connection error"** → Check internet connection, Supabase project may be paused (free tier pauses after inactivity)
- **"Email not confirmed"** → Check your inbox (including spam) for confirmation email
- **Nothing happens on button click** → Check browser console (F12) for errors
