Create table Users
(
	Uid int identity(1,1) primary key not null,
	Username nvarchar(100) Null,
	Password nvarchar(100) Null,
	Email nvarchar(100) Null,
	Name nvarchar(100) Null,
	Usertype nvarchar(50) Null
)


select *from Users;


create table ForgotPass
(
	Id nvarchar(500) not null,
	Uid int null,
	RequestDateTime DATETIME null,
	Constraint [FK_ForgotPass_Users] FOREIGN KEY ([Uid]) REFERENCES [Users] ([Uid])
)

select *from ForgotPass;
delete from ForgotPass;

/*Product data in store database and create and display the table and data*/
create table tblBrands
(
	BrandId int identity(1,1) primary key,
	Name nvarchar(500)
)

create table tblCategory
(
	CatId int identity(1,1) primary key,
	CatName nvarchar(MAX)
)

create table tblSubCategory
(
	SubCatId int identity(1,1) primary key,
	SubCatName nvarchar(MAX),
	MainCatId int null,
	Constraint [FK_tblSubCategory_tblCategory] FOREIGN KEY ([MainCatId]) REFERENCES [tblCategory] ([CatId])
)

create table tblGender
(
	GenderId int identity(1,1) primary key,
	GenderName nvarchar(MAX)
)

create table tblSizes
(
	SizeId int identity(1,1) primary key,
	SizeName binary(50),
	BrandId int,
	CatrgoryId int,
	SubCategoryId int,
	GenderId int,
	Constraint [FK_tblSizes_ToBrand] FOREIGN KEY ([BrandId]) REFERENCES [tblBrands] ([BrandId]),
	Constraint [FK_tblSizes_ToCat] FOREIGN KEY ([CatrgoryId]) REFERENCES [tblCategory] ([CatId]),
	Constraint [FK_tblSizes_SubCat] FOREIGN KEY ([SubCategoryId]) REFERENCES [tblSubCategory] ([SubCatId]),
	Constraint [FK_tblSizes_Gender] FOREIGN KEY ([GenderId]) REFERENCES [tblGender] ([GenderId])
)

create table tblProducts
(
	PId int identity(1,1) primary key,
	PName nvarchar(MAX),
	PPrice money,
	PSellPrice money,
	PBrandID int,
	PCategoryID int,
	PSubCatID int,
	PGender int,
	PSizesID int,
	PDescription nvarchar(MAX),
	PProductDetails nvarchar(MAX),
	PMaterialCare nvarchar(MAX),
	FreeDelivery int,
	[30DayRet] int,
	COD int,
	Constraint [FK_tblProducts_ToTable] FOREIGN KEY ([PBrandId]) REFERENCES [tblBrands] ([BrandId]),
	Constraint [FK_tblProducts_ToTable1] FOREIGN KEY ([PCategoryID]) REFERENCES [tblCategory] ([CatId]),
	Constraint [FK_tblProducts_ToTable2] FOREIGN KEY ([PSubCatID]) REFERENCES [tblSubCategory] ([SubCatId]),
	Constraint [FK_tblProducts_ToTable3] FOREIGN KEY ([PGender]) REFERENCES [tblGender] ([GenderId]),
	Constraint [FK_tblProducts_ToTable4] FOREIGN KEY ([PSizesID]) REFERENCES [tblSizes] ([SizeId])
)

/* Upload Images table*/
Create table tblProductImages
(
	PIMGId int identity(1,1) primary key,
	PID int,
	Name nvarchar(MAX),
	Extension nvarchar(500),
	Constraint [FK_tblProductImages_ToTable] FOREIGN KEY ([PId]) REFERENCES [tblProducts] ([PId]),
)

select *from tblProductImages;

--Create table tblProImage
--(
--	PIMGId int identity(1,1) primary key,
--	PID int,
--	Name nvarchar(MAX),
--	Extension nvarchar(500),
--	Constraint [FK_tblProImage_ToTable] FOREIGN KEY ([PId]) REFERENCES [tblProducts] ([PId]),
--)

create table tblProductSizeQuantity
(
	PrdSizeQuantID int identity(1,1) primary key,
	PID int,
	SizeID int,
	Quantity int,
	Constraint [FK_tblProductSizeQuantity_ToTable] FOREIGN KEY ([PId]) REFERENCES [tblProducts] ([PId]),
	Constraint [FK_tblProductSizeQuantity_ToTable1] FOREIGN KEY ([SizeId]) REFERENCES [tblSizes] ([SizeId])
)

Alter table tblSizes 
Alter Column SizeName nvarchar(500)

/*QUERY FETCH AND DISPLAY*/
select *from tblBrands;
select *from tblCategory;
select *from tblSubCategory;
select *from tblGender;
select *from tblSizes;
select *from tblProducts;

select A.*,B.* from tblSubCategory A inner join tblCategory B on B.CatId = A.MainCatId;

select A.*,B.*,C.*,D.*,E.* from tblSizes A inner join tblCategory B on B.CatId = a.CatrgoryId inner join tblBrands C on C.BrandId = A.BrandId inner join tblSubCategory D on D.SubCatId = A.SubCategoryId inner join tblGender E on E.GenderId = A.GenderId;







/*Create a Stored Procedure */
Create procedure sp_InserProduct
(
	@PName nvarchar(MAX),
	@PPrice money,
	@PSellPrice money,
	@PBrandID int,
	@PCategoryID int,
	@PSubCatID int,
	@PGender int,
	@PDescription nvarchar(MAX),
	@PProductDetails nvarchar(MAX),
	@PMaterialCare nvarchar(MAX),
	@FreeDelivery int,
	@30DayRet int,
	@COD int
)
as

insert into tblProducts values (@PName,@PPrice,@PSellPrice,@PBrandID,@PCategoryID,@PSubCatID,@PGender,@PDescription,@PProductDetails,@PMaterialCare,@FreeDelivery,@30DayRet,@COD)
select SCOPE_IDENTITY();
Return 0;

select *from tblProducts;
select *from tblGender;
delete from tblProducts;
delete from tblProductSizeQuantity;
delete from tblProductImages;


delete from tblProductImages;

select *from tblProductSizeQuantity;
select * from tblProductImages;

/*create a procedure (cart.aspx.cs)*/
Alter PROCEDURE GetProductDetails
    @SizeID INT,
    @PID INT
AS
BEGIN
    SELECT A.*, 
           dbo.abcSizeName(@SizeID) AS SizeNamee,
           @SizeID AS SizeIDD,
           SizeData.Name,
           SizeData.Extension 
    FROM tblProducts A
    CROSS APPLY 
    (
        SELECT TOP 1 B.Name, B.Extension 
        FROM tblProductImages B 
        WHERE B.PID = A.PID
    ) AS SizeData
    WHERE A.PID = @PID;
END
GO

EXEC GetProductDetails @SizeID = 1, @PID = 123;





/* create procedure for ProductsView web form*/
Alter procedure productAllbind
AS
select A.*,B.*,A.PPrice-A.PSellPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName from tblProducts A
inner join tblBrands C on C.BrandId = A.PBrandID
cross apply(
select top 1 * from tblProductImages B where B.PID = A.PId order by B.PID desc
)B
order by A.PId desc
Return 0





/*Create a table purchase in payment method*/
Create table tblPurchase
(
	PurchaseID int identity(1,1) primary key,
	UserID int,
	PIDSizeID nvarchar(MAX),
	CartAmount money,
	CartDiscount money,
	TotalPayed money,
	PaymentType nvarchar(50),
	PaymentStatus nvarchar(50),
	DateOfPurchase datetime,
	Name nvarchar(200),
	Address nvarchar(MAX),
	Pincode nvarchar(10),
	MobileNumber nvarchar(50),
	CONSTRAINT [FK_tblPurchase_ToUser] FOREIGN KEY ([UserID]) REFERENCES [Users] ([Uid])
)

ALTER TABLE tblOrders
(
    OrderID INT IDENTITY(1,1) PRIMARY KEY,       -- Unique identifier for each order
    UserID INT NOT NULL,                          -- User who placed the order
    PidSizeId VARCHAR(MAX) NOT NULL,              -- Product ID and Size info
    CartAmount DECIMAL(18, 2) NOT NULL,           -- Total cart amount
    CartDiscount DECIMAL(18, 2) NOT NULL,        -- Cart discount
    TotalPayed DECIMAL(18, 2) NOT NULL,           -- Total amount to be paid
    PaymentType VARCHAR(50) NOT NULL,             -- Payment method (e.g., Paytm, COD)
    PaymentStatus VARCHAR(50) NOT NULL,           -- Status of the payment (e.g., NotPaid, Paid)
    PurchaseDate DATETIME NOT NULL DEFAULT GETDATE(),  -- Date of the order
    Name VARCHAR(255) NOT NULL,                   -- Customer's name
    Address VARCHAR(255) NOT NULL,                -- Customer's address
    PinCode VARCHAR(10) NOT NULL,                 -- Customer's pin code
    MobileNumber VARCHAR(15) NOT NULL,            -- Customer's mobile number
    OrderStatus VARCHAR(50) DEFAULT 'Delivered'     -- Order status (e.g., Pending, Shipped, Delivered)
);

select *from tblOrders;
select *from tblPurchase;


/*Create Procedure for MainShirt Item*/
Create procedure [dbo].[procBindAllProducts2]
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSellPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName 
from tblProducts A
inner join tblBrands C on C.BrandId =A.PBrandID
inner join tblCategory as t2 on t2.CatId=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Shirt' 
order by A.PID desc

Return 0

/*create table tblcart*/
CREATE TABLE tblCart(
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NULL,
	[PID] [int] NULL,
	[PName] [nvarchar](max) NULL,
	[PPrice] [money] NULL,
	[PSellPrice] [money] NULL,
	[SubPAmount]  AS ([PPrice]*[Qty]),
	[SubSAmount]  AS ([PSellPrice]*[Qty]),
	[Qty] [int] NULL,
)


/*stored procedure bindcartzz*/
Create PROCEDURE SP_BindCartNumberz
(
@UserID int
)
AS
SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extension FROM tblProductImages E WHERE E.PID = D.PID) Name where D.UID = @UserID
--1

Create PROCEDURE SP_BindUserCart
(
@UserID int
)
AS
SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extension FROM tblProductImages E WHERE E.PID = D.PID) Name WHERE D.UID = @UserID
--2


CREATE PROCEDURE SP_getUserCartItem
(
@PID int,
@UserID int
)
AS
SELECT * FROM tblCart WHERE PID = @PID AND UID = @UserID
--3

CREATE PROCEDURE SP_UpdateCart
(
@UserID int,
@CartPID int,
@Quantity int
)
AS
BEGIN
SET NOCOUNT ON;
UPDATE tblCart SET Qty = @Quantity WHERE PID = @CartPID AND UID = @UserID
END

go
--4

CREATE PROCEDURE SP_DeleteThisCartItem
@CartID int
AS
BEGIN
DELETE FROM tblCart WHERE CartID = @CartID
END


USE ShoppingDB;
EXEC sp_helptext 'SP_BindUserCart';

select *from tblCart;
SELECT * FROM INFORMATION_SCHEMA.TABLES;

SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'tblProductImages';

/*tblCart*/
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'tblCart';
SELECT * FROM INFORMATION_SCHEMA.TABLES;
USE ShoppingDB;
EXEC sp_helptext 'SP_BindUserCart';

select *from tblProductImages;



