# Statuses
Status.create([
  { label: 'Président'},
  { label: 'Trésorier'},
  { label: 'Secrétaire'},
  { label: 'Membre actif'},
  { label: "Membre d'honneur" }
])

# Activities
Activity.create(label: "Fonctionnement général de l'association")

# Accounts
Account.create(label: 'Caisse de monnaie', reference: 'CAISSE_MONNAIE')

Setting.items_per_page = 20
Setting.region = 'FR'
Setting.currency = '€'
