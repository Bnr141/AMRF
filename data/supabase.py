import os
from supabase import create_client, Client

url: str = os.environ.get("REDACTED")
key: str = os.environ.get("REDACTED")

supabase: Client = create_client(url, key)

response = supabase.table("AMRF").select("*").execute()

print(response.data)