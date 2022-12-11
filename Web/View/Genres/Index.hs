module Web.View.Genres.Index where
import Web.View.Prelude

data IndexView = IndexView { genres :: [Genre]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewGenreAction} class="btn btn-primary ms-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Genre</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach genres renderGenre}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Genres" GenresAction
                ]

renderGenre :: Genre -> Html
renderGenre genre = [hsx|
    <tr>
        <td>{genre}</td>
        <td><a href={ShowGenreAction genre.id}>Show</a></td>
        <td><a href={EditGenreAction genre.id} class="text-muted">Edit</a></td>
        <td><a href={DeleteGenreAction genre.id} class="js-delete text-muted">Delete</a></td>
    </tr>
|]