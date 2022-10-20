use EShop
select * from Product where name='Funny'
delete product where name='Funny'

USE [EShop]
GO

UPDATE [dbo].[Product]
   SET [Name] = 'Jhoomer'
      ,[Cost] = 15000
      ,[CategoryId] = 11
 WHERE Product.[Name]='Dummy'

delete orders where productId In (select Id from product where product.CategoryId=11)
delete product where CategoryId=11
delete ProductCategory where  name='lights'

declare @ProductCount int
declare @Category nvarchar(50)
declare cur_TrendingCategories cursor For
select count(product.name) as productcount , ProductCategory.name from product
right outer join ProductCategory on product.CategoryId=ProductCategory.Id 
group by ProductCategory.Name

open cur_TrendingCategories

fetch next from cur_TrendingCategories
into @ProductCount,@Category
--logic

while @@FETCH_STATUS=0
begin  
	if @ProductCount >3
		print @Category + 'is trending'
	else if @ProductCount>0 and @ProductCount<=3
		print @category + 'has normal purchases'
	else
		print @category +'has no new product'

fetch next from cur_TrendingCategories into @ProductCount,@Category
end
close cur_TrendingCategories
deallocate cur_TrendingCategories