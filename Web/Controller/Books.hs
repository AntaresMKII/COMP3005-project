module Web.Controller.Books where

import Web.Controller.Prelude
import Web.View.Books.Index
import Web.View.Books.New
import Web.View.Books.Edit
import Web.View.Books.Show

import Application.BooksQuery

instance Controller BooksController where
    action BooksAction = do
        --books <- query @Book |> fetch
        --books <- sqlQuery   "SELECT * FROM books, wrote, authors WHERE books.id = wrote.book_id AND authors.id = wrote.author_id" ()
        booksWithAuthorName <- fetchBookWithAuthorName
        render IndexView { .. }

    action ShowBookAction { bookId } = do
        --book <- fetch bookId
        (book:_) <- fetchBookWithInfo (Only bookId)
        render ShowView { .. }

buildBook book = book
    |> fill @["isbn", "nPages", "summary", "price", "title", "releaseDate", "inStock", "publisherPercentage", "publisherId"]
