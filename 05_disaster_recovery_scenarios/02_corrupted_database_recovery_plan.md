# Bozulan Veritabanını Kurtarma Senaryosu

## Senaryo

Veritabanı dosyası bozulmuş veya sunucu erişilemez hale gelmiştir.

## Kurtarma Planı

1. Son başarılı full backup bulunur.
2. Son differential backup bulunur.
3. Full yedekten sonraki log backup zinciri kontrol edilir.
4. Restore sırası belirlenir.
5. Restore işlemi uygulanır.
6. DBCC CHECKDB ile doğrulama yapılır.
7. Uygulama bağlantıları test edilir.
