                 --1.
Create Function FormattedPhone

(@Phone nvarchar(20)) 

returns nvarchar(20)

as

begin



Declare @ReturnPhone nvarchar(20);



Set @ReturnPhone = (



Case 



When len(replace(@Phone,' ',''))=10 

then LEFT(REPLACE(replace(@Phone, ' ',''),@Phone,'+90'),3) + ' ' + '('+ SUBSTRING(replace(@Phone, ' ',''), 1,3)+')' + ' ' + 
SUBSTRING(replace(@Phone, ' ',''), 4,3) + ' ' + SUBSTRING(replace(@Phone, ' ',''), 7,2) + ' ' + RIGHT(replace(@Phone, ' ',''),2)



When  len(replace(@Phone,' ',''))=11 


then LEFT(REPLACE(replace(@Phone, ' ',''),@Phone,'+90'),3) + ' ' +'('+ SUBSTRING(replace(@Phone, ' ',''), 2,3)+')' + ' ' + 
SUBSTRING(replace(@Phone, ' ',''), 5,3) + ' ' + SUBSTRING(replace(@Phone, ' ',''), 8,2) + ' ' + RIGHT(replace(@Phone, ' ',''),2)

else @Phone 

end

);

return @ReturnPhone;

end



select dbo.FormattedPhone(Phone) as Telefon from dbo.calisanlar --select Function_adý(kolon adý) from tablo adý 

select Calisan_id,Calisan_adi,
dbo.FormattedPhone(Phone) as 'Telefon formati',--Telefon format Fonksiyonunu çaðýrdýk
year(getdate())-Year(D_tarih) as  yas--yasý yazdýrmak için kolon hesabý yaptýk 
from calisanlar 
where YEAR(getdate())-year(D_tarih)<40--40 yaþýnda küçük olma þartý
and Calisan_id Between 2 and 5-- between ile calisan_id 2 ve 5 arasýnda olanlarý getirdik

                                 --2.
DECLARE @mail99 NVARCHAR(MAX) ,--Declare ile deðiþkenleri tanýmlýyoruz
@isim NVARCHAR(MAX) = 'semih',
@soyisim NVARCHAR(MAX)= 'senturk',
@domain NVARCHAR(MAX)= '@bilgeadam.com';
SET @mail99=@isim+'.'+@soyisim+@domain;--daha sonra deðiþkeni set ediyoruz
PRINT @mail99 ;--print ile istediðimiz deðiþkeni yazdýrabiliriz


