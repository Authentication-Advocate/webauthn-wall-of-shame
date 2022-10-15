---
---
<script src="assets/js/sorttable.js"></script>

<details open>
<summary>
Why does this exist?
</summary>
Web Authentication (WebAuthN) is a means to authenticate users that is almost completely resistant to phishing and related attacks. When a system uses WebAuthN for authentication there is no known way for an adversary to trick the user into authenticating on behalf of them; a system using WebAuthN cannot be phished. It is the most user-friendly and flexible technology with this feature and is a direct descendant of U2F which was also created by the FIDO Allliance.

Unphishable authentication is here and available, but we can't get its benefits because of how specific applications work.

Despite being published in 2016, support for WebAuthN is inconsistent at best. In particular, it is extremely difficult to configure a common identity system such as Okta to require WebAuthN for user authentication. This is because native applications, such as those on iOS, Android, Windows, or MacOS have been built in ways that prevent use of WebAuthN for authentication. The problems in these applications is most often that they use a technology called a WebView for authentication. This was always a bad practice, as it means the application has direct access to users' credentials and their session token with the identity provider in fundamental conflict with the intent of technologies such as OAuth, but makes it impossible to support WebAuthN. As a result, the identity system must support phishable authentication. An adversary will target the phishiable authentication that must be supported instead of the stronger WebAuthN, dramatically reducing the security benefit of adopting WebAuthN.

</details>

{% assign all = site.vendors | sort: "name" %}
{% assign vendors = "" | split: ',' %}
{% assign call_us = "" | split: ',' %}
{% for vendor in all %}
	{% if vendor.sso_pricing contains "Call" %}
		{% assign call_us = call_us | push: vendor %}
	{% else %}
		{% assign vendors = vendors | push: vendor %}
	{% endif %}
{% endfor %}

## The List

<table class="sortable">
<thead>
<tr><th>Vendor</th><th>Web App</th><th>iOS App</th><th>Android App</th><th>Windows Client</th><th>Mac Client</th><th>Linux Client</th><th>Date Updated</th></tr>
</thead>
<tbody>
{% for vendor in vendors %}
<tr>
<td markdown="span"><a href="{{ vendor.vendor_url }}">{{ vendor.name }}</a></td>
<td markdown="span">
{% if vendor.web == true %}
&#10003;
{% else %}
<a href="{{ vendor.test_results }}">{{ vendor.web }}</a>
{% endif %}
</td>
<td markdown="span">
{% if vendor.ios_app == true %}
&#10003;
{% else %}
<a href="{{ vendor.test_results }}">{{ vendor.ios_app }}</a>
{% endif %}
</td>
<td markdown="span">
{% if vendor.android_app == true %}
&#10003;
{% else %}
<a href="{{ vendor.test_results }}">{{ vendor.android_app }}</a>
{% endif %}
</td>
<td markdown="span">
{% if vendor.windows_client == true %}
&#10003;
{% else %}
<a href="{{ vendor.test_results }}">{{ vendor.windows_client }}</a>
{% endif %}
</td>
<td markdown="span">
{% if vendor.mac_client == true %}
&#10003;
{% else %}
<a href="{{ vendor.test_results }}">{{ vendor.mac_client }}</a>
{% endif %}
</td>
<td markdown="span">
{% if vendor.linux_client == true %}
&#10003;
{% else %}
<a href="{{ vendor.test_results }}">{{ vendor.linux_client }}</a>
{% endif %}
</td>
<td>{{ vendor.updated_at }}</td>
</tr>
{% endfor %}
</tbody>
</table>

## FAQs

<details>
<summary>
What's a WebView?
</summary>
<a href="https://developer.android.com/reference/android/webkit/WebView">A WebView is a low-feature web browser</a> built into an operating system for use in applications. It lacks numerous features, including support FIDO2. Their use in authentication has been known as a bad idea for many years, and <a href="https://developers.googleblog.com/2021/06/upcoming-security-changes-to-googles-oauth-2.0-authorization-endpoint.html">Internet companies have begun actively preventing its use more recently</a>.
</details>

<details>
<summary>
I'm a vendor and this data is wrong!
</summary>
Please feel free to submit a PR to this page. I only want this data to be accurate.
</details>

## Attributions
* This code enabling this project was forked from the work of [robchahin](https://github.com/robchahin) on the [SSO Wall of Shame](https://github.com/robchahin/sso-wall-of-shame). They are in no way endorsing the content published here.

## Footnotes
{% for vendor in vendors %}
{{ vendor.footnotes }}
{% endfor %}
{% for vendor in call_us %}
{{ vendor.footnotes }}
{% endfor %}
