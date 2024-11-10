import os
from supabase import create_client, Client

url: str = os.environ.get("REDACTED")
key: str = os.environ.get("REDACTED")

supabase: Client = create_client(url, key)

for x in range(500,508):
    response = supabase.table("AMRF").delete().eq("id", x).execute()
