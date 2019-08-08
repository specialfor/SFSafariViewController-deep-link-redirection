# SFSafariViewController-deep-link-redirection
Proof of concepts for idea of handling deep link redirection inside **SFSafariViewController**.

## How to test 

1. Run terminal in project root directory.
2. Run `cd server`.
3. Run `python -m SimpleHTTPServer`.
4. Open `DeepLinkCheburek.xcodeproj`.
5. Build & Run app on simulator. 

## What is needed for implementation

### On client side

1. Add custom url scheme inside `Info -> URL Types` section of target's settings.
![url type](https://i.imgur.com/3EL5j16.png)
2. Turn on `Allow Arbitrary Loads` flag inside `info.plist`.
![info plist](https://i.imgur.com/eq3U3VY.png)
3. Implement `func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool` method inside `AppDelegate`.

### On server side

Implement redirection to custom url scheme using, for example, the next script on redirecting web page:
``` javascript
<script>
    var redirectToApp = function() {
        document.location = 'my-deep-link://smth';
    };

    window.onload = redirectToApp;
</script>
```

## Links
[Defining a Custom URL Scheme for Your App](https://developer.apple.com/documentation/uikit/inter-process_communication/allowing_apps_and_websites_to_link_to_your_content/defining_a_custom_url_scheme_for_your_app)

[SFSafariViewController](https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller)
