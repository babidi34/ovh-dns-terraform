import ovh
import yaml
import os

client = ovh.Client(
    endpoint=os.getenv("OVH_ENDPOINT"),
    application_key=os.getenv("OVH_APPLICATION_KEY"),
    application_secret=os.getenv("OVH_APPLICATION_SECRET"),
    consumer_key=os.getenv("OVH_CONSUMER_KEY"),
)
domain = input("Veuillez renseigner le domaine : ")

try:
    # Récupérer les ID des entrées DNS du domaine
    dns_entries_ids = client.get(f'/domain/zone/{domain}/record')

    # Récupérer les détails de chaque entrée DNS
    dns_entries = []
    for entry_id in dns_entries_ids:
        entry_details = client.get(f'/domain/zone/{domain}/record/{entry_id}')
        dns_entries.append(entry_details)

    # Afficher les entrées DNS
    for entry in dns_entries:
        print(f"ID: {entry['id']}, Type: {entry['fieldType']}, Target: {entry['target']}, Subdomain: {entry['subDomain']}, TTL: {entry['ttl']}")

except ovh.exceptions.APIError as e:
    print(f"Erreur API OVH: {e}")