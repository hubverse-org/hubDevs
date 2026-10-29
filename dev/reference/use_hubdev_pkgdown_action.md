# Use the hubdev custom pkgdown GitHub Action

The functions creates a `pkgdown-netlify-preview.yaml` action in the
`.github/workflows` directory. The action follows the standard pkgdown
publishing to `gh-pages` in the event of a merge into `main` branch but
can also be set up to publish internal PR previews to Netlify.

## Usage

``` r
use_hubdev_pkgdown_action(remove_std = TRUE, ref = NULL, overwrite = FALSE)
```

## Arguments

- remove_std:

  Logical. Whether to remove the standard pkgdown action if it exists.

- ref:

  Tag, branch or commit SHA of
  [hubverse-org/hubverse-developer-actions](https://github.com/hubverse-org/hubverse-developer-actions)
  to download from. Defaults to the latest release.

- overwrite:

  Logical. Whether to replace an existing file without asking. When
  `FALSE`, an interactive session asks first and a non-interactive
  session leaves the existing file unchanged.

## Details

To activate Netlify Previews, you must:

- Create a new site on Netlify. See
  <https://docs.netlify.com/welcome/add-new-site/> for more details.

- "Add the netlify API site ID to the GitHub repository Action secrets
  as `NETLIFY_SITE_ID`. See
  <https://docs.netlify.com/api/get-started/#get-site> for more details.

- Get developer token from Netlify developer account settings and add it
  to GitHub repository Action secrets as `NETLIFY_AUTH_TOKEN`. See
  <https://docs.netlify.com/cli/get-started/#obtain-a-token-in-the-netlify-ui>
  for more details.

See
[pkgdown](https://hubverse-org.github.io/hubDevs/dev/reference/pkgdown)
docs section on [PR
previews](https://pkgdown.r-lib.org/articles/customise.html#pr-previews)
for more details.
