# Yanlışlıkla Silinen Veriyi Kurtarma Senaryosu

## Senaryo

Bir kullanıcı yanlışlıkla kritik kayıtları silmiştir.

```sql
DELETE FROM dbo.BackupRecoveryTest;
```

## Kurtarma Adımları

1. Silme işleminin zamanı belirlenir.
2. Tail-log backup alınır.
3. Full backup restore edilir.
4. Differential backup restore edilir.
5. Log backup STOPAT ile güvenli zamana kadar restore edilir.
6. Veri kontrol edilir.

## Önemli Not

Canlı veritabanı doğrudan restore edilmeden önce ayrı bir test veritabanına restore yapmak daha güvenlidir.
