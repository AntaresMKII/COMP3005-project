module Web.View.Authors.Edit where
import Web.View.Prelude

data EditView = EditView { author :: Author }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit Author</h1>
        {renderForm author}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Authors" BooksAction
                , breadcrumbText "Edit Author"
                ]

renderForm :: Author -> Html
renderForm author = formFor author [hsx|
    {(textField #bio)}
    {(textField #nationality)}
    {(textField #fname)}
    {(textField #lname)}
    {(textField #dob)}
    {submitButton}

|]
