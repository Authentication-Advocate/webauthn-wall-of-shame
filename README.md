# webauthn-wall-of-shame

A list of vendors that are preventing widespread enforcement of WebAuthn leaving organizations unncessarily vulnerable to phishing.

Page structure lives in index.md, including intro text and FAQs for now.

Vendor data lives in `_vendors/`.

## Adding another product to this repositsory
1. Duplicate an existing file in [_vendors](_vendors/)
1. Rename to to correspond to the product you're trying to add
1. Fill in its details in the YAML file
1. Run the repo locally to confirm things look the way you intended/expected
1. Commit, push, and create a PR

## Change the data being presented
1. Find the corresponding `.yaml` file in [_vendors](_vendors/)
1. Input the corrected value for the appropriate app platform, supported values are:
  - `true`: the application on this platform supports WebAuthn/FIDO2
  - `webview`: the application on this platform fails to support WebAuthn/FIDO2 becuase it uses a WebView
  - `unclear`: the application on this platform fails to support WebAuthn/FIDO2 and it's not due to a WebView

## Testing Changes / Running Locally
To run this code, such as to begin making changes, clone this repo and run:
```
make
```
This will start the webapp running on `127.0.0.1:8080` where it should be accessible at http://127.0.0.1:8080. The source files are bind-mounted so you can edit them with an editor of your choice and should generally see our changes reflected on page refresh. Certain changes may require restarting the container, which can be done by running `exit` in the container and then `make` again from the repo basedir.
