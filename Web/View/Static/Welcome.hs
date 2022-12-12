module Web.View.Static.Welcome where
import Web.View.Prelude

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
        <div>
            <h1>Look Inna Book</h1>
            <a href={pathTo BooksAction} class="btn btn-primary ms-4">Browse All Books</a>
        </div>
|]
