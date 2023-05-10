USE biblioteca;
delimiter $$

-- Using errors handling:

-- Make an stored procedure in order to insert a new author in the biblioteca database.
-- The sored procedure parameters will be:
-- 1. author name.
-- 2. author nacionality.
-- If you make the insert using the parameters, you can have 1 foreign key error because nacionality, 
-- does not exist in the nacionalitas table , in this case you have to insert the new nacionality in 
-- the nacionalitats table and redo the author insert.

DROP PROCEDURE if exist newAutor$$
CREATE PROCEDURE newAutor
    @NOM_AUT VARCHAR(50),
    @FK_NACIONALITAT VARCHAR(50)
AS
BEGIN
    DECLARE @NationalityId INT
    
    BEGIN TRY
        -- Check if nationality exists
        SELECT @NationalityId = NationalityId
        FROM nacionalitats
        WHERE NationalityName = @FK_NACIONALITAT
        
        -- If nationality does not exist, insert it
        IF @NationalityId IS NULL
        BEGIN
            INSERT INTO nacionalitats (NationalityName)
            VALUES (@FK_NACIONALITAT)
            
            SELECT @NationalityId = SCOPE_IDENTITY()
        END
        
        -- Insert author with nationality id
        INSERT INTO authors (NOM_AUT, NationalityId)
        VALUES (@NOM_AUT, @NationalityId)
        
    END TRY
    BEGIN CATCH
        -- Handle foreign key error by retrying
        IF ERROR_NUMBER() = 547
        BEGIN
            INSERT INTO nacionalitats (NationalityName)
            VALUES (@FK_NACIONALITAT)
            
            SELECT @NationalityId = SCOPE_IDENTITY()
            
            INSERT INTO authors (NOM_AUT, NationalityId)
            VALUES (@NOM_AUT, @NationalityId)
        END
        ELSE
        BEGIN
            -- Log or raise other errors
            THROW;
        END
    END CATCH
END
