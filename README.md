# Stripe + Padrino + Ebook

A very basic example for using Stripe together with Padrino to sell an web-accessible version of an ebook. Could be 
used as the starting point for selling an html ebook, an article, implementing a paywall etc.

![Screenshot](https://raw.github.com/k2052/padrino-ebook/master/screenshot.png)

## Usage

Rename _.env_example_ to _.env_ and edit the values to match your own.

Then run:
    
    $ bundle
    $ foreman start

To run the tests do:

    $ bundle exec padrino rake spec

The book files are in app/views/book and the TOC is in data.
