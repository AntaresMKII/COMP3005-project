module Web.View.Authors.Index where
import Web.View.Prelude

data IndexView = IndexView { authors :: [Author]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewAuthorAction} class="btn btn-primary ms-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Author</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach authors renderAuthor}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Authors" BooksAction
                ]

renderAuthor :: Author -> Html
renderAuthor author = [hsx|
    <tr>
        <td>{author}</td>
        <td><a href={ShowAuthorAction author.id}>Show</a></td>
        <td><a href={EditAuthorAction author.id} class="text-muted">Edit</a></td>
        <td><a href={DeleteAuthorAction author.id} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
