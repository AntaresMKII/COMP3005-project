module Web.Controller.Books where

import Web.Controller.Prelude
import Web.View.Books.Index
import Web.View.Books.Show

instance Controller BooksController where
    action BooksAction = do
        books <- sqlQuery "SELECT * FROM books" ()
        render IndexView { .. }

    action ShowBookAction { isbn } = do
        (book:_) :: [Book] <- sqlQuery "SELECT * FROM books WHERE isbn = ?" (Only isbn)
        --book <- fetch bookId
        render ShowView { .. }


buildBook book = book
    |> fill @["nPages", "summary", "price", "title", "releaseDate", "inStock", "publisherPercentage", "pEmail"]
