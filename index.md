---
---
<script src="assets/js/sorttable.js"></script>

<details open>
<summary>
Why does this exist?
</summary>
The products in this list do not support WebAuthn when used with an external [identity provider](https://en.wikipedia.org/wiki/Identity_provider). This lack of support means an organization cannot make WebAuthn a mandatory part of their authentication flow; a single incompatible app can prevent an entire oganization from moving forward. This is the typical deployment for these products in an Enterprise environment, and specifically impacts organizations' use of these products. The products may actually have their own, specifically built, WebAuthn support; that is not what this list is about.

Unphishable authentication is here and available, but we can't get its benefits because of how specific applications work.
</details>

<details>
<summary>
What is WebAuthn?
</summary>
Web Authentication (WebAuthn) is a means to authenticate users that is [highly resistant to phishing and related attacks](https://www.cisa.gov/sites/default/files/publications/fact-sheet-implementing-phishing-resistant-mfa-508c.pdf#page=2). When a system uses WebAuthn for authentication there is no known way for an adversary to trick the user into authenticating on behalf of them; a system using WebAuthn cannot be phished. It is the most user-friendly and flexible technology with this feature and is a direct descendant of U2F which was also created by the FIDO Allliance.
</details>

<details>
<summary>
What is the problem?
</summary>
Despite being published in 2016, support for WebAuthn is inconsistent at best. In particular, it is extremely difficult to configure an [identity provider](https://en.wikipedia.org/wiki/Identity_provider) to require WebAuthn for user authentication. This is because native applications, such as those on iOS, Android, Windows, or MacOS have been built in ways that prevent use of WebAuthn for authentication. The problems in these applications is most often that they use a technology called a WebView for authentication. This was always a bad practice, as it means the application has direct access to users' credentials and their session token with the identity provider in fundamental conflict with the intent of technologies such as OAuth, and makes it impossible to support WebAuthn. As a result, the identity system must support phishable authentication. An adversary will target the phishiable authentication that must be supported instead of the stronger WebAuthn, dramatically reducing the security benefit of adopting WebAuthn.
</details>

{% assign all = site.vendors | sort: "name" %}
{% assign vendors = "" | split: ',' %}
{% for vendor in all %}
	{% assign vendors = vendors | push: vendor %}
{% endfor %}

## The List

<table class="sortable">
<thead>
<tr><th>Vendor</th><th>iOS App</th><th>Android App</th><th>Windows Client</th><th>Mac Client</th><th>Linux Client</th><th>Date Updated</th></tr>
</thead>
<tbody>
{% for vendor in vendors %}
<tr>
<td markdown="span"><a href="{{ vendor.vendor_url }}">{{ vendor.name }}</a></td>

<!-- iOS App Platform -->
<td markdown="span">
<!-- Try to reflect the product's behavior on this platform with text/symbols -->
{% if vendor.ios_app == true %}
<!-- If app was tested and it worked -->
	&#10003;
{% elsif vendor.ios_app == nil or vendor.ios_app == "" %}
<!-- If we have no information about this app -->
<!-- Deliberately blank -->
<!-- At this point in the logic the app did not work with FIDO2 -->
{% else %}
	{% if vendor.ios_app == "webview" %}
	<!-- If don't have specific test results to link to -->
		<a onclick="document.getElementById('webview').scrollIntoView({behavior: 'smooth', block: 'start'});"><span class="x">X</span><span class="symbol">&#9635;</span></a>
	{% else %}
	<!-- We have specific testing results to link to -->
		<a onclick="document.getElementById('unclear').scrollIntoView({behavior: 'smooth', block: 'start'});"><span class="x">X</span><span class="symbol">&#63;</span></a>
	{% endif %}
{% endif %}
<!-- Whew, done with that app platform -->
</td>

<!-- Android App Platform -->
<td markdown="span">
<!-- Try to reflect the product's behavior on this platform with text/symbols -->
{% if vendor.android_app == true %}
<!-- If app was tested and it worked -->
	&#10003;
{% elsif vendor.android_app == nil or vendor.android_app == "" %}
<!-- If we have no information about this app -->
<!-- Deliberately blank -->
<!-- At this point in the logic the app did not work with FIDO2 -->
{% else %}
	{% if vendor.android_app == "webview" %}
	<!-- If don't have specific test results to link to -->
		<a onclick="document.getElementById('webview').scrollIntoView({behavior: 'smooth', block: 'start'});"><span class="x">X</span><span class="symbol">&#9635;</span></a>
	{% else %}
	<!-- We have specific testing results to link to -->
		<a onclick="document.getElementById('unclear').scrollIntoView({behavior: 'smooth', block: 'start'});"><span class="x">X</span><span class="symbol">&#63;</span></a>
	{% endif %}
{% endif %}
<!-- Whew, done with that app platform -->
</td>

<!-- Windows Client Platform -->
<td markdown="span">
<!-- Try to reflect the product's behavior on this platform with text/symbols -->
{% if vendor.windows_client == true %}
<!-- If app was tested and it worked -->
	&#10003;
{% elsif vendor.windows_client == nil or vendor.windows_client == "" %}
<!-- If we have no information about this app -->
<!-- Deliberately blank -->
<!-- At this point in the logic the app did not work with FIDO2 -->
{% else %}
	{% if vendor.windows_client == "webview" %}
	<!-- If don't have specific test results to link to -->
		<a onclick="document.getElementById('webview').scrollIntoView({behavior: 'smooth', block: 'start'});"><span class="x">X</span><span class="symbol">&#9635;</span></a>
	{% else %}
	<!-- We have specific testing results to link to -->
		<a onclick="document.getElementById('unclear').scrollIntoView({behavior: 'smooth', block: 'start'});"><span class="x">X</span><span class="symbol">&#63;</span></a>
	{% endif %}
{% endif %}
<!-- Whew, done with that app platform -->
</td>

<!-- Mac Client Platform -->
<td markdown="span">
<!-- Try to reflect the product's behavior on this platform with text/symbols -->
{% if vendor.mac_client == true %}
<!-- If app was tested and it worked -->
	&#10003;
{% elsif vendor.mac_client == nil or vendor.mac_client == "" %}
<!-- If we have no information about this app -->
<!-- Deliberately blank -->
<!-- At this point in the logic the app did not work with FIDO2 -->
{% else %}
	{% if vendor.mac_client == "webview" %}
	<!-- If don't have specific test results to link to -->
		<a onclick="document.getElementById('webview').scrollIntoView({behavior: 'smooth', block: 'start'});"><span class="x">X</span><span class="symbol">&#9635;</span></a>
	{% else %}
	<!-- We have specific testing results to link to -->
		<a onclick="document.getElementById('unclear').scrollIntoView({behavior: 'smooth', block: 'start'});"><span class="x">X</span><span class="symbol">&#63;</span></a>
	{% endif %}
{% endif %}
<!-- Whew, done with that app platform -->
</td>

<!-- Linux Client Platform -->
<td markdown="span">
<!-- Try to reflect the product's behavior on this platform with text/symbols -->
{% if vendor.linux_client == true %}
<!-- If app was tested and it worked -->
	&#10003;
{% elsif vendor.linux_client == nil or vendor.linux_client == "" %}
<!-- If we have no information about this app -->
<!-- Deliberately blank -->
<!-- At this point in the logic the app did not work with FIDO2 -->
{% else %}
	{% if vendor.linux_client == "webview" %}
	<!-- If don't have specific test results to link to -->
		<a onclick="document.getElementById('webview').scrollIntoView();"><span class="x">X</span><span class="symbol">&#9635;</span></a>
	{% else %}
	<!-- We have specific testing results to link to -->
		<a onclick="document.getElementById('unclear').scrollIntoView();"><span class="x">X</span><span class="symbol">&#63;</span></a>
	{% endif %}
{% endif %}
<!-- Whew, done with that app platform -->
</td>

<td>{{ vendor.updated_at }}</td>
</tr>
{% endfor %}
</tbody>
</table>

## Problem Categories
<table>
<thead>
<tr><th>Icon</th><th>Problem</th><th>Description</th></tr>
</thead>
<tbody>
<tr>
<td>&#9635;</td><td markdown="span" id="webview">WebView</td><td>This product appears to use a WebView in its application for this platform. <a href="https://developer.android.com/reference/android/webkit/WebView">A WebView is a low-feature web browser</a> built into an operating system for use in applications. It lacks numerous features, including support for FIDO2. Their use in authentication has been known as a bad idea for many years, and <a href="https://developers.googleblog.com/2021/06/upcoming-security-changes-to-googles-oauth-2.0-authorization-endpoint.html">Internet companies have begun actively preventing its use more recently</a>.</td>
</tr>
<tr>
<td>?</td><td markdown="span" id="unclear">Unclear</td><td>We're not sure what the product's application is doing, but FIDO2 authentication doesn't work with the application provided on this platform.</td>
</tr>
</tbody>
</table>

## FAQs
<details>
<summary>
I'm a vendor and this data is wrong!
</summary>
Please feel free to <a href="https://github.com/Authentication-Advocate/webauthn-wall-of-shame">submit a PR to this repository</a> or <a href="https://github.com/Authentication-Advocate/webauthn-wall-of-shame/issues/new/choose">submit an issue</a>. We want this data to be accurate.
</details>

<details>
<summary>
I know something that isn't on this list!
</summary>
Please feel free to <a href="https://github.com/Authentication-Advocate/webauthn-wall-of-shame">submit a PR to this repository</a> or <a href="https://github.com/Authentication-Advocate/webauthn-wall-of-shame/issues/new/choose">submit an issue</a>.
</details>

## Attributions
* This code enabling this project was forked from the work of [robchahin](https://github.com/robchahin) on the [SSO Wall of Shame](https://github.com/robchahin/sso-wall-of-shame). They are in no way endorsing the content published here.

## Footnotes
{% for vendor in vendors %}
{{ vendor.footnotes }}
{% endfor %}
