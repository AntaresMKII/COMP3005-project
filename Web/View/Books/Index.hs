module Web.View.Books.Index where
import Web.View.Prelude

import Application.BooksQuery

data IndexView = IndexView { booksWithAuthorName :: [BookWithAuthorName]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Books</h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Book</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach booksWithAuthorName renderBook}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Home" WelcomeAction
                , breadcrumbLink "Books" BooksAction
                ]

renderBook :: BookWithAuthorName -> Html
renderBook book = [hsx|
    <tr>
        <td>{book.fname}</td>
        <td>{book.lname}</td>
        <td>{book.title}</td>
        <td>${book.price}</td>
        <td><a href={ShowBookAction book.id}>Show</a></td>
    </tr>
|]
