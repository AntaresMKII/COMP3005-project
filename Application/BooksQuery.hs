module Application.BooksQuery (
    fetchBookWithAuthorName,
    BookWithAuthorName (..),
                              ) where

import IHP.Prelude
import IHP.ModelSupport
import Database.PostgreSQL.Simple
import Database.PostgreSQL.Simple.FromRow (field, fromRow)
import qualified Generated.Types as Types
import IHP.Controller.Param

data BookWithAuthorName = BookWithAuthorName
    { id :: Id Types.Book
    , fname :: Text
    , lname :: Text
    , title :: Text
    , price :: Float
    }
    deriving(Eq, Show)

instance FromRow BookWithAuthorName where
    fromRow =
        BookWithAuthorName
            <$> field
            <*> field
            <*> field
            <*> field
            <*> field

fetchBookWithAuthorName :: (?modelContext :: ModelContext) => IO [BookWithAuthorName]
fetchBookWithAuthorName = do
    sqlQuery "SELECT books.id, authors.fname, authors.lname, books.title, books.price FROM books, wrote, authors WHERE books.id = wrote.book_id AND authors.id = wrote.author_id" ()
