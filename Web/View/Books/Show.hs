module Web.View.Books.Show where
import Web.View.Prelude

import Application.BooksQuery

data ShowView = ShowView { book :: BookWithInfo }

-- this instance of view is used to show one book information
instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>{book.title}</h1>
        <p>By {book.author_fname} {book.author_lname}</p>
        <div>
            <h2>Summary</h2>
            {book.summary}
        </div>
        <div>
            <h2>Price: ${book.price}</h2>
            <p>{book.in_stock} copies in stock</p>
            <h2>Book Info</h2>
            <p>Genre: {book.genre_name}</p>
            <p>ISBN: {book.isbn}</p>
            <p>Number of Pages: {book.n_pages}</p>
            <p>Release Date: {book.release_date}</p>

            <h2>Publisher Info</h2>
            <p>{book.publisher_name}</p>
            <p>Email: {book.publisher_email}</p>
            <p>Address: {book.publisher_address}</p>
        </div>


    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Books" BooksAction
                            , breadcrumbText "Show Book"
                            ]
