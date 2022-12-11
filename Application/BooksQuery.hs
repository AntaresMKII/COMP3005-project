module Application.BooksQuery (
    fetchBookWithAuthorName,
    BookWithAuthorName (..),
    fetchBookWithInfo,
    BookWithInfo(..),
                              ) where

import IHP.Prelude
import IHP.ModelSupport
import Database.PostgreSQL.Simple
import Database.PostgreSQL.Simple.FromRow (field, fromRow)
import qualified Generated.Types as Types
import IHP.Controller.Param
import Data.Time.Calendar

data BookWithAuthorName = BookWithAuthorName
    { id :: Id Types.Book
    , fname :: Text
    , lname :: Text
    , title :: Text
    , price :: Float
    }
    deriving(Eq, Show)

data BookWithInfo = BookWithInfo
    { id :: Id Types.Book
    , isbn :: Text
    , n_pages :: Int
    , summary :: Text
    , price :: Float
    , title :: Text
    , release_date :: Data.Time.Calendar.Day
    , in_stock :: Int
    , publisher_percenage :: Int
    , genre_name :: Text
    , author_fname :: Text
    , author_lname :: Text
    , publisher_email :: Text
    , publisher_name :: Text
    , publisher_address :: Text
    }
    deriving (Eq, Show)

instance FromRow BookWithAuthorName where
    fromRow =
        BookWithAuthorName
            <$> field
            <*> field
            <*> field
            <*> field
            <*> field

instance FromRow BookWithInfo where
    fromRow =
        BookWithInfo
            <$> field
            <*> field
            <*> field
            <*> field
            <*> field
            <*> field
            <*> field
            <*> field
            <*> field
            <*> field
            <*> field
            <*> field
            <*> field
            <*> field
            <*> field

fetchBookWithAuthorName :: (?modelContext :: ModelContext) => IO [BookWithAuthorName]
fetchBookWithAuthorName = do
    sqlQuery "SELECT books.id, authors.fname, authors.lname, books.title, books.price FROM books, wrote, authors WHERE books.id = wrote.book_id AND authors.id = wrote.author_id" ()

fetchBookWithInfo :: (?modelContext :: ModelContext, ToRow q) => q -> IO [BookWithInfo]
fetchBookWithInfo = sqlQuery bookWithInfoQuery

bookWithInfoQuery :: Query
bookWithInfoQuery = "SELECT books.id, books.isbn, books.n_pages, books.summary, books.price, books.title, books.release_date, books.in_stock, books.publisher_percentage, genres.name AS genre_name, authors.fname AS author_fname, authors.lname AS author_lname, publishers.email AS publisher_email, publishers.name AS publisher_name, publishers.address AS publisher_address FROM books, genres, authors, publishers, wrote, is_genre WHERE books.publisher_id = publishers.id AND books.id = is_genre.book_id AND genres.id = is_genre.genre_id AND wrote.book_id = books.id AND wrote.author_id = authors.id AND books.id = ?;"
