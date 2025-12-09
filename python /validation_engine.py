import pandas as pd

df = pd.read_csv('../data/tickets_sample.csv')

df['created_at'] = pd.to_datetime(df['created_at'])
df['resolved_at'] = pd.to_datetime(df['resolved_at'])

# Calculate AHT (average handle time)
df['aht_minutes'] = (df['resolved_at'] - df['created_at']).dt.total_seconds() / 60

# Calculate SLA
df['sla_met'] = df['resolved_at'] <= df['created_at'] + pd.Timedelta(hours=48)

print("Average Handle Time (mins): ", df['aht_minutes'].mean())
print("SLA %: ", df['sla_met'].mean())
print("Backlog Count: ", sum(df['status'] == 'open'))
