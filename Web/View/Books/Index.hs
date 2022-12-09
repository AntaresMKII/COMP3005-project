module Web.View.Books.Index where
import Web.View.Prelude

data IndexView = IndexView { books :: [Book]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index</h1>
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
                <tbody>{forEach books renderBook}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Books" BooksAction
                ]

renderBook :: Book -> Html
renderBook book = [hsx|
    <tr>
        <td>{book}</td>
        <td><a href={ShowBookAction book.isbn}>Show</a></td>
    </tr>
|]
