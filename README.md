# TextUp Marketing Emails

Generates inlined HTML for TextUp marketing email template for MailChimp. Uses Premailer in a Jekyll Hook to convert generated `_site/index.html` to `_site/index-inlined.html`

## Installation

* In the project folder, run `bundle install`.
    * Ruby version used for development is `ruby 2.3.1p112`
    * [For Nokogiri install issues on MacOS Mojave](https://github.com/sparklemotion/nokogiri/issues/1801#issuecomment-442455785)
* To build the static site, run `bundle exec jekyll build`
* To spin up a server that watches and rebuilds the site, run `bundle exec jekyll serve`

## Tips

* For ease of development, we use links to the MailChimp-hosted image assets instead of local links. When adding new images consider uploading to MailChimp's Content Manager first and use the generated resource link in these templates.
* When inlining CSS, Premailer preserves CSS in media queries because most mobile email clients that would need these additional styles can understand CSS media queries. All CSS properties in media queries **should be marked with `!important` in order to be able to override the inlined CSS**
* We use variables in `_config.yml` instead of using a Sass variables (with a Sass compiler). Any changes to `_config.yml` require a server restart in order for the changes to be picked up. In the future, consider moving to using Sass directly.

## Helpful links

* [Jekyll 3.6.3 RubyDocs](https://www.rubydoc.info/gems/jekyll/3.6.3/Jekyll)
* [Premailer 1.11.0 RubyDocs](https://www.rubydoc.info/gems/premailer/1.11.0/Premailer)
* [Automated email testing tool with some coverage of major email clients](http://www.inboxinspector.com/)
* [MailChimp email design/programming tips](https://templates.mailchimp.com/)
* [MailChimp templating language guide](https://templates.mailchimp.com/getting-started/template-language/)
